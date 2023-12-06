# frozen_string_literal: true

MythixRailsAdmin::Engine.routes.draw do
  root to: 'base#index'
  post '/action', to: 'base#action'
end
