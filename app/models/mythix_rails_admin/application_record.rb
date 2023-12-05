# frozen_string_literal: true

module MythixRailsAdmin
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
