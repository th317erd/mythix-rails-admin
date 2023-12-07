# frozen_string_literal: true

require_relative '../../../test_helper'

describe 'Natr' do
  describe 'Parser' do
    it 'test_unwonkify_works' do
      parser = MythixRailsAdmin::Natr::Parser.new(models: [ User ])
      # _(parser.unwonkify('user where name is dude')).must_equal('user.name=dude')
      # _(parser.unwonkify('user where first name is dude and last name bob wazzowskie')).must_equal('user.name=dude')
    end
  end
end
