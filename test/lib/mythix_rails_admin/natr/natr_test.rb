# frozen_string_literal: true

require_relative '../../../test_helper'

describe 'Natr' do
  describe 'Parser' do
    describe 'unwonkify' do
      it 'works' do
        parser = MythixRailsAdmin::Natr::Parser.new(models: [ User, AddonGroup, CollectionFeature ])
        result = parser.unwonkify('collection feature where name is dude')
        _(result).must_equal('CollectionFeature.[[first_name||last_name]]=dude')

        result = parser.unwonkify('collection feature where name is "dude collection feature addon group"')
        _(result).must_equal('CollectionFeature.[[first_name||last_name]]="dude collection feature addon group"')

        result = parser.unwonkify('collection feature where name is dude and user name is burp')
        _(result).must_equal('CollectionFeature.[[first_name||last_name]]=dude and User[[first_name||last_name]]=burp')
        # _(parser.unwonkify('user where first name is dude and last name bob wazzowskie')).must_equal('user.name=dude')
      end
    end

    describe 'parse_natural' do
      it 'works' do
        parser = MythixRailsAdmin::Natr::Parser.new(models: [ User, AddonGroup, CollectionFeature ])

        begin
          result = parser.parse_natural('(collection feature where name is dude or (user name is burp)) not and user age like 10')
          _(result).must_equal('CollectionFeature.[[first_name||last_name]]="dude collection feature addon group"')
        rescue StandardError => e
          puts e, e.backtrace
        end
      end
    end
  end
end
