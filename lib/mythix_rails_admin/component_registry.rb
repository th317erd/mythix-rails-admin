# frozen_string_literal: true

require 'singleton'

class ComponentRegistry
  include Singleton

  def components
    registry.merge
  end

  def register(klass)
    registry[klass.name.demodulize.to_sym] = klass
  end

  private

  def registry
    @registry ||= {}
  end
end
