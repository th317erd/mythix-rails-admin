# frozen_string_literal: true

module MythixRailsAdmin
  module Natr
    class Parser
      @@wonky_patterns = [
        {
          pattern: /\s*where\s*/,
          helper: ->(_match, _index) { '.' }
        },
        {
          pattern: /\s*is\s*/,
          helper: ->(_match, _index) { '=' }
        },
      ]

      def map_application_models(models)
        model_data = {}

        models.each do |model|
          model_name = model.name.demodulize
          data = model_data[model_name] = {}
          attributes = model.attribute_names
          data[:attributes] = attributes
          aliases = data[:aliases] = {}

          attributes.each do |attribute_name|
            attribute_name.split(/[^a-zA-Z0-9]/).map do |name|
              name = name.strip

              aliases[name] = [] if !aliases[name]
              aliases[name] << attribute_name
            end
          end
        end

        model_data
      end

      def initialize(models:)
        @models = map_application_models(models)
      end

      # Take a human readable string, and try to
      # make it more machine readable
      #
      # i.e. user where name is wyatt
      # would turn into
      # user.name = wyatt
      def unwonkify(str, extra_patterns = nil)
        str = str.strip.split(/\s+/).each do |part|
          puts "PART: #{part}"
        end

        patterns = @@wonky_patterns + (extra_patterns || [])
        patterns.each do |pattern|
          str = str.gsub(pattern[:pattern]).with_index do |*args, **params|
            pattern[:helper].call(*args, **params)
          end
        end

        str
      end

      def parse_natural(str)
        str.downcase.gsub('')
      end
    end
  end
end
