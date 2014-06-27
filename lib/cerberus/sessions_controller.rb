require 'cerberus/identity'

class Cerberus::SessionsController < ActionController::Base
  def create
    identity = Cerberus::Identity.find_or_create_by! auth.slice(:provider, :uid)
    identity.user ||= Cerberus.config[:identities][:user_class_name].constantize.find_or_create_by! email: auth[:info][:email]
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
