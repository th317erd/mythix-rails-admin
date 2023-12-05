# frozen_string_literal: true

MythixRailsAdmin::Engine.routes.draw do
  root to: "admin#index"
  post '/action', to: 'admin#action'
end
