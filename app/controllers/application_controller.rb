class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  end
  