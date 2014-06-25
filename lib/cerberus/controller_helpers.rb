module Cerberus::ControllerHelpers
  def current_user
    Cerberus.config.user_class.constantize.find(session[:user_id]) if session[:user_id]
  end
end
