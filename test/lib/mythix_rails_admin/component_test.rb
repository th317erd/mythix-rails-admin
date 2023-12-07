# frozen_string_literal: true

# rubocop:disable Lint/ConstantDefinitionInBlock

require_relative '../../test_helper'

describe 'Component' do
  it 'auto registers when new class created' do
    internal_components = MythixRailsAdmin::Component.registered_components
    captured = nil

    MythixRailsAdmin::Component.stub :inherited, ->(*args) { captured = args } do
      class Test < MythixRailsAdmin::Component; end
      assert(captured == [ Test ])
    end

    assert(MythixRailsAdmin::Component.registered_components == internal_components)

    class Test2 < MythixRailsAdmin::Component; end
    assert(MythixRailsAdmin::Component.registered_components == internal_components.merge({ Test2: Test2 }))

    class Test3 < Test2; end
    assert(MythixRailsAdmin::Component.registered_components == internal_components.merge({
      Test2: Test2,
      Test3: Test3,
    }))
  end
end
