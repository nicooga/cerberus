require 'cerberus/identity'

class Cerberus::SessionsController < ActionController::Base
  def create
    identity = Cerberus::Identity.find_or_create_by! auth.slice(:provider, :uid)
    identity.user ||= Cerberus.config.user_class.constantize.find_or_create_by! auth.slice(:email)
    identity.save

    session[:user_id] = identity.user.id
    redirect_to '/'
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  private

  def auth() env['omniauth.auth'] end
end

