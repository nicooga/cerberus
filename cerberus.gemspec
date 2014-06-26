$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cerberus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_cerberus"
  s.version     = Cerberus::VERSION
  s.authors     = ['Nicolas Oga']
  s.email       = ['2112.oga@gmail.coom']
  s.homepage    = 'https://github.com/nicooga/cerberus'
  s.summary     = 'RoR + omniauth wrapper'
  s.description = 'Little wrapper aroudn Rails and Omniauth to authenticate users'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_dependency 'omniauth', '~> 1.0'
end
