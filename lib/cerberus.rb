module Cerberus
  def self.mount_on(router)
    router.get '/auth/:provider/callback', to: 'cerberus/sessions#create'
    router.get '/logout', to: 'cerberus/sessions#destroy'
  end

  def self.root() File.dirname(__dir__) end
  def self.config
    config_defaults.deep_merge(
      YAML.load_file(
        File.join(Dir.pwd, 'config/cerberus.yaml')
      ).with_indifferent_access
    )
  end
  def self.config_defaults
    { identity: { user_class_name: 'User' } }
  end
end

require 'cerberus/railtie'
require 'cerberus/controller_helpers'
require 'cerberus/sessions_controller'
