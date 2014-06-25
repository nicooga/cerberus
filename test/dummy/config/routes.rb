Dummy::Application.routes.draw do
  Cerberus.mount_on(self)
  root to: 'application#root'
end
