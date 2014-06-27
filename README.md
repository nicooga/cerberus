Cerberus
========

This is a tiny plugin for Rails 3+ that uses omniauth to provide authentication and it's name is Cerberus.
![](http://th00.deviantart.net/fs71/PRE/f/2011/181/7/f/cerberus_by_genzoman-d3kkisd.jpg)

## Installation
~~~ruby
gem 'rails_cerberus', require: 'cerberus'
gem 'omniauth-google-oauth2' # include all the providers gems you are gonna use
~~~

### Requirements
- your aplication must implement an User class. If you want to change, write a file `config/cerberus.yaml`:
~~~yaml
identities:
  user_class_name: User
~~~
### Usage

~~~bash
# run the migration task to create cerberus_identites table
rake db:migrate:cerberus
~~~

~~~ruby
# config/initializers/omniauth.rb
# configure omniauth keys
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end

# config/routes.rb
# mount cerberus routes and define a root path
Dummy::Application.routes.draw do
  Cerberus.mount_on(self)
  root to: 'application#root'
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Cerberus::ControllerHelpers
  
  # which just means...
  helper_method :current_user

  def current_user
    Cerberus.config[:identities][:user_class_name]
    .constantize.find(session[:user_id]) if session[:user_id]
  end
end
~~~
And that'all. Redirect your users to `/auth/:provider` to authenticate users. Redirect them to `/logout` to, well, you get it.

The codebase is really small, if you find out some way to improve it just make a pull request.
