# frozen_string_literal: true

module MythixRailsAdmin
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      puts 'Hello world!'
    rescue StandardError => e
      render plain: "Error: #{e.message}"
    end

    def action
      render json: { success: true }
    rescue StandardError => e
      render json: { success: false, errors: [e.message] }
    end
  end
end
