# frozen_string_literal: true

module MythixRailsAdmin
  class AdminController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      begin
        puts "Hello world!"
      rescue StandardError => e
        render plain: "Error: #{e.message}"
      end
    end

    def action
      begin
        render json: { success: true }
      rescue StandardError => e
        render json: { success: false, errors: [ e.message ] }
      end
    end
  end
end
