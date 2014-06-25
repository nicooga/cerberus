class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Cerberus::ControllerHelpers

  def root
    render text: "AHUE: #{current_user.inspect}; AHUE: #{session[:user_id]}"
  end
end
