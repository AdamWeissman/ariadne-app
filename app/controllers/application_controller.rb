require './config/environment'

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
      erb :'/outside_the_maze/start'
    end
  end

  helpers do

    def current_user
      @current_user ||= User.find(session[:your_session])
    end

    def logged_in?
      !!session[:your_session] #!! converts variable to its boolean value
    end

  end


  get '/about' do
    if logged_in?
      redirect '/about2'
    else
      erb :'/outside_the_maze/about'
    end
  end

  get '/about2' do
    if logged_in?
      erb :'/inside_the_maze/about2'
    else
      redirect '/about'
    end
  end

  get '/signup' do
    if !session[:your_session]
      erb :'/outside_the_maze/signup'
    else
      redirect '/you_signedup'
    end
  end

  get '/you_signedup' do
    erb :'/outside_the_maze/you_signedup'
  end

  post '/you_signedup' do
    @user = User.create(params)
    erb :'/outside_the_maze/you_signedup'
  end

  get '/login' do
    if !session[:your_session]
      erb :'/outside_the_maze/login'
    else
      redirect '/account_home'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:your_session] = @user.id
      redirect '/account_home'
    else
      erb :'/outside_the_maze/minotaur'
    end
  end

  get '/account_home' do
    if logged_in?
      @user = current_user
      erb :'/inside_the_maze/account_home'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      @user = current_user
      @user = nil
      session.destroy
      erb :'/inside_the_maze/logout'
    else
      erb :'/inside_the_maze/logout'
    end
  end

  get '/contact' do
    if logged_in?
      @user = current_user
      erb :'/inside_the_maze/contact'
    else
      erb :'/outside_the_maze/contact'
    end
  end

  get '/no_access' do
    erb :'/outside_the_maze/minotaur2'
  end

  patch '/update_in_place/:id' do #THIS IS THE ONE THAT'S KILLING ME!
    @user = current_user
    @project = Project.find(params[:id])
    #@project = Project.find_by(user: params[:user_id], id: params[:project_id])
    @project.project_name = params[:project_name]
    @project.project_summary = params[:project_summary]
    @project.the_initial_blob_to_parse = params[:the_initial_blob_to_parse]
    @project.save
    erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
    #redirect "/phase_1_preview/#{@project.id}"
  end

  get '/phase_1_preview/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
    else
      redirect '/no_access'
    end
  end

  post '/phase_1_saved/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      @project.project_name = params[:project_name]
      @project.project_summary = params[:project_summary]
      @project.the_initial_blob_to_parse = params[:the_initial_blob_to_parse]
      erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
    else
      redirect '/no_access'
    end
  end

  get '/phase_1_preview_something_sucked_let_me_fix_it' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_1/phase_1_fix_the_preview'
    else
      redirect '/no_access'
    end
  end




# DO NOT DO WORK BELOW THIS LINE UNTIL ALL ABOVE ARE WORKING.

# PHASE II

  get '/phase_2/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
    else
      redirect '/no_access'
    end
  end

  get '/phase_2_saved' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_2/phase_2_complete_with_data'
    else
      redirect '/no_access'
    end
  end

# PHASE III

  get '/phase_3' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_3/phase_3_first_iteration'
    else
      redirect '/no_access'
    end
  end

  get '/phase_3_saved' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_3/phase_3_complete_with_data'
    else
      redirect '/no_access'
    end
  end

  # PHASE IV

  get '/phase_4' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_4/phase_4_first_iteration'
    else
      redirect '/no_access'
    end
  end

  get '/phase_4_saved' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_4/phase_4_complete_with_data'
    else
      redirect '/no_access'
    end
  end

  # PHASE V YOU ARE HERE...

  get '/phase_5' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_5/phase_5_first_iteration'
    else
      redirect '/no_access'
    end
  end

  get '/phase_5_saved' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_5/phase_5_complete_with_data'
    else
      redirect '/no_access'
    end
  end

end
