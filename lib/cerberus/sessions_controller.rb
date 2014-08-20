require 'cerberus/identity'

class Cerberus::SessionsController < ActionController::Base
  def create
    identity = Cerberus::Identity.find_or_create_by! identity_params
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
  def auth_params() @auth_params ||= ActionController::Parameters.new(auth) end
  def identity_params() auth_params.permit(:provider, :uid) end
  def user_params() auth_params.permit(info: [:email]) end
end
