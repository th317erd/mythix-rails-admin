# frozen_string_literal: true

Rails.application.routes.draw do
  mount MythixRailsAdmin::Engine => '/mythix_rails_admin'
end
