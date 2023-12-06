# frozen_string_literal: true

require_relative 'component_registry'

module MythixRailsAdmin
  class Component
    class << self
      def inherited(subclass)
        super
        ComponentRegistry.instance.register(subclass)
      end

      def registered_components
        ComponentRegistry.instance.components
      end
    end

    def render; end
  end
end

# Load all components
Dir[File.join(__dir__, 'components', '*.rb')].sort.each { |file| require file }
