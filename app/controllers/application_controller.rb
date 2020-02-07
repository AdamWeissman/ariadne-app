require './config/environment'
require_all 'lib'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "enter_the_labyrinth"
  end

  get '/' do
    if logged_in?
      redirect '/account_home'
    else
      erb :'/not_logged_in/start'
    end
  end

  helpers do

    def current_user
      @current_user ||= User.find(session[:your_session])
    end

    def logged_in?
      !!session[:your_session] #!! converts variable to its boolean value
    end

    def authenticated_project?
      @project.user_id == @user.id
    end

  end


  get '/about' do
    if logged_in?
      redirect '/about2'
    else
      erb :'/not_logged_in/about'
    end
  end

  get '/about2' do
    if logged_in?
      erb :'/user_is_logged_in/about2'
    else
      redirect '/about'
    end
  end

  get '/signup' do
    if !session[:your_session]
      erb :'/user_is_logged_in/signup'
    else
      redirect '/you_signedup'
    end
  end

  get '/you_signedup' do
    erb :'/user_is_logged_in/you_signedup'
  end

  post '/you_signedup' do
    @user = User.create(params)
    redirect '/login'
  end

  get '/login' do
    if !session[:your_session]
      erb :'/not_logged_in/login'
    else
      redirect '/account_home'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:your_session] = @user.id
      redirect '/projects'
    else
      erb :'/not_logged_in/minotaur'
    end
  end

  get '/account_home' do
    if logged_in?
      @user = current_user
      erb :'/user_is_logged_in/account_home'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      @user = current_user
      @user = nil
      session.destroy
      erb :'/user_is_logged_in/logout'
    else
      erb :'/user_is_logged_in/logout'
    end
  end

  get '/contact' do
    if logged_in?
      @user = current_user
      erb :'/user_is_logged_in/contact'
    else
      erb :'/not_logged_in/contact'
    end
  end

  get '/no_access' do
    erb :'/not_logged_in/minotaur2'
  end

# DO NOT DO WORK BELOW THIS LINE UNTIL ALL ABOVE ARE WORKING.

# PHASE II



# PHASE III


  # PHASE IV YOU ARE HERE...

  # PHASE V Y

  get '/phase_5' do
    if logged_in?
      erb :'/user_is_logged_in/phase_5/phase_5_first_iteration'
    else
      redirect '/no_access'
    end
  end

  get '/phase_5_saved' do
    if logged_in?
      erb :'/user_is_logged_in/phase_5/phase_5_complete_with_data'
    else
      redirect '/no_access'
    end
  end

end
