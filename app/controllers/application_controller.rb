require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "enter_the_labyrinth"
  end

  get '/' do
    erb :'/outside_the_maze/start'
  end

  helpers do

    def logged_in?
      !!current_user #!! converts variable to its boolean value
    end

    def current_user
      @current_user ||= User.find_by(id: session[:your_session]) #variable is created and assigned, if user is found
    end
  end

# THE WHOLE ENCHILADA

#logged in is fake_account_home, logged out is fake_start

  get '/account_home/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/inside_the_maze/account_home'
  end

#logged out is sans the numeral ... if there's a 2 it means logged in

  get '/about' do
    erb :'/outside_the_maze/about'
  end

  get '/about2' do
    erb :'/inside_the_maze/about2'
  end

# these three are related

  get '/login' do
    erb :'/outside_the_maze/login'
  end

  get '/signup' do
    erb :'/outside_the_maze/signup'
  end

  get '/logout' do
    erb :'/inside_the_maze/logout'
  end

# CONTACT is only available if you are logged in
  get '/contact' do
    erb :'/inside_the_maze/contact'
  end

# PROJECT STUFF MAIN MENU
  get '/projects' do
    erb :'/inside_the_maze/adventures/projects_home'
  end

  get '/create_a_new_project' do
    erb :'/inside_the_maze/adventures/new_project'
  end

  get '/edit_a_project' do
    erb :'/inside_the_maze/adventures/edit_a_project'
  end

  get '/delete_a_project' do
    erb :'/inside_the_maze/adventures/delete_a_project'
  end

  get '/delete_a_project_for_real' do
    erb :'/inside_the_maze/adventures/delete_a_project_for_real'
  end

# PROJECT STUFF PHASE I (NEW PROJECT) -- starts with create_a_new_project

  get '/phase_1_preview' do
    erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
  end

  get '/phase_1_saved' do
    erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
  end

  get '/phase_1_preview_something_sucked_let_me_fix_it' do
    erb :'/inside_the_maze/adventures/phase_1/phase_1_fix_the_preview'
  end

# PHASE II

  get '/phase_2' do
    erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
  end

  get '/phase_2_saved' do
    erb :'/inside_the_maze/adventures/phase_2/phase_2_complete_with_data'
  end

# PHASE III

  get '/phase_3' do
    erb :'/inside_the_maze/adventures/phase_3/phase_3_first_iteration'
  end

  get '/phase_3_saved' do
    erb :'/inside_the_maze/adventures/phase_3/phase_3_complete_with_data'
  end

# PHASE IV

  get '/phase_4' do
    erb :'/inside_the_maze/adventures/phase_4/phase_4_first_iteration'
  end

  get '/phase_4_saved' do
    erb :'/inside_the_maze/adventures/phase_4/phase_4_complete_with_data'
  end

# PHASE V YOU ARE HERE...

  get '/phase_5' do
    erb :'/inside_the_maze/adventures/phase_5/phase_5_first_iteration'
  end

  get '/phase_5_saved' do
    erb :'/inside_the_maze/adventures/phase_5/phase_5_complete_with_data'
  end



end
