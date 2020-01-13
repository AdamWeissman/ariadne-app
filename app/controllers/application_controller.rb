require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "enter_the_labyrinth"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user #!! converts variable to its boolean value
    end

    def current_user
      @current_user ||= User.find_by(id: session[:work_hard]) #variable is created and assigned, if user is found
    end
  end

end
