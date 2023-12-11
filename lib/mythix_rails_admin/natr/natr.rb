# frozen_string_literal: true

require 'English'

module MythixRailsAdmin
  module Natr
    class Parser
      @@quoted_string_pattern = /(["'])(?:\\\1|[^\1])*\1/
      @@substitution_pattern = /<<<<\[(\d+)\]>>>>/

      def map_application_models(models)
        model_data = {}

        models.each do |model|
          model_name = model.name.demodulize

          data = model_data[model_name] = { model_name: model_name }
          data[:model_name_alises] = []

          data[:model_name_alises] << model_name.underscore.split(/_+/).join(' ')

          attributes = model.attribute_names
          data[:attributes] = attributes
          attribute_aliases = data[:attribute_aliases] = {}

          attributes.each do |attribute_name|
            attribute_name.split(/[^a-zA-Z0-9]/).map do |name|
              name = name.strip
              next if name == attribute_name

              attribute_aliases[name] = [] if !attribute_aliases[name]
              attribute_aliases[name] << attribute_name
            end
          end
        end

        model_data
      end

      def initialize(models:)
        @models = map_application_models(models)
        # pp 'Model map: ', @models
      end

      def unsubstitute(str, substitutions)
        str.gsub(@@substitution_pattern) do |match|
          substitution_index = ::Regexp.last_match(1).to_i
          value = substitutions[substitution_index]
          value = unsubstitute(value, substitutions) if value.is_a?(String) && str =~ @@substitution_pattern

          if block_given?
            yield(value, substitutions, match)
          else
            value
          end
        end
      end

      def degrammarify(str)
        str
          .gsub(/(?:\s+|\b)where(?:\s+|\b)/, '.')
          .gsub(/(?:\s+|\b)(is|equals?|matches|match|the\s+same\s+as)(?:\s+|\b)/, '=')
          .strip
      end

      # Take a human readable string, and try to
      # make it more machine readable
      #
      # i.e. user where name is wyatt
      # would turn into
      # user.first_name = 'wyatt' OR user.last_name = 'wyatt'
      def unwonkify(str)
        substitutions = []

        # First, protect things like quoted strings
        # i.e. user name is "something with a space"
        str = str.gsub(@@quoted_string_pattern) do |match|
          substitution_index = substitutions.size
          substitutions << match
          "<<<<[#{substitution_index}]>>>>"
        end

        str = str.strip.downcase.gsub(/\s+/, ' ')

        @models.each do |modal_name, model_info|
          model_name_aliases = model_info[:model_name_alises]

          # First coerce model names
          # i.e. "collection feature" becomes "CollectionFeature"
          model_name_aliases.each do |model_name_alias|
            str = str.gsub(model_name_alias, modal_name)
          end

          # Second coerce field names
          # i.e. "name" becomes "first_name OR last_name"
          attribute_aliases = model_info[:attribute_aliases]
          attribute_aliases.each do |attribute_name_alias, attribute_names|
            # TODO: Filter aliases here with model support
            str = str.gsub(Regexp.new("(?:\\s+|\\b)#{Regexp.escape(attribute_name_alias)}(?:\\s+|\\b)")) do
              substitution_index = substitutions.size
              substitutions << "[[#{attribute_names.join('||')}]]"
              "<<<<[#{substitution_index}]>>>>"
            end
          end
        end

        str = unsubstitute(str, substitutions)

        degrammarify(str)
      end

      def parse_natural(str)
        str = unwonkify(str)

        substitutions = []

        # First, protect things like quoted strings
        # i.e. user name is "something with a space"
        str = str.gsub(@@quoted_string_pattern) do |match|
          substitution_index = substitutions.size
          substitutions << match
          "<<<<[#{substitution_index}]>>>>"
        end

        group_proc = lambda do |grouping_part|
          puts "Grouping part: #{grouping_part}"
          logical_operator = 'AND'
          parts = []
          previous_offset = 0
          grouping_part.strip.gsub(/(?:\s+|\b)((?:not\s+)?(?:and|or)(?:\s+not)?)/) do |match|
            offset = $LAST_MATCH_INFO.offset(0)
            part = str.slice(previous_offset..offset[0])

            if part != '(' && part != ')'
              parts << {
                logical_operator: logical_operator,
                part: part.strip
              }
            end

            previous_offset = offset[1] + 1
            logical_operator = match.strip.upcase.gsub(/\s+/, ' ')
            logical_operator = 'AND NOT' if logical_operator == 'NOT AND'
            logical_operator = 'OR NOT' if logical_operator == 'OR AND'

            match
          end

          if previous_offset < grouping_part.size
            part = grouping_part.slice(previous_offset..)
            if part != '(' && part != ')'
              parts << {
                logical_operator: logical_operator,
                part: part.strip
              }
            end
          end

          substitution_index = substitutions.size
          substitutions << parts

          "<<<<[#{substitution_index}]>>>>"
        end

        loop do
          new_str = str.gsub(/\([^\(\)]+?\)/, &group_proc)
          if new_str == str
            str = group_proc.call(str)
            break
          else
            str = new_str
          end
        end

        unsubstitute(str, substitutions) do |value, subs|
          if value.is_a?(Array)
            value = value.map do |item|
              if item[:part] && item[:part] =~ @@substitution_pattern
                item[:part] = unsubstitute(item[:part], subs)
                item[:parent] = value
              end

              item
            end
          end

          ''
        end

        all_parts = []
        substitutions.each do |part|
          next false if !part.is_a?(Array)

          all_parts += part
        end

        all_parts = all_parts.select do |part|
          part[:parent].nil?
        end

        pp 'Parts: ', all_parts
      end
    end
  end
end
