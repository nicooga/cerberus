module Cerberus
  def self.mount_on(router)
    router.get '/auth/:provider/callback', to: 'cerberus/sessions#create'
    router.get '/logout', to: 'cerberus/sessions#destroy'
  end

  def self.config
    @config ||= Config.new(
      user_class: 'User'
    )
  end

  def self.root() File.dirname(__dir__) end

  class Config
    attr_accessor :user_class
    def initialize(attrs) attrs.each { |k,v| send "#{k}=", v } end
  end
end

require 'cerberus/railtie'
require 'cerberus/controller_helpers'
require 'cerberus/sessions_controller'
