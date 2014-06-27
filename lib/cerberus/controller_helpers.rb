module Cerberus::ControllerHelpers
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    Cerberus.config[:identities][:user_class_name]
    .constantize.find(session[:user_id]) if session[:user_id]
  end
end
