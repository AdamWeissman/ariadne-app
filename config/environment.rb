ENV['SINATRA_ENV'] ||= "development" #for heroku change to production.

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite" #would change this for heroku
)

require './app/controllers/application_controller' #this probably needs to be loaded first.  can experiment to see if otherwise.
#require './app/controllers/projects_home_controller'
require_all 'app'
