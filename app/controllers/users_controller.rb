class UsersController < ApplicationController

  #route necessary for login
  get '/login' do
    erb :login
  end

  #this route receives the login form, finds the user and logs the user in
  #it creates a session
  post '/login' do
    # Find the user
    @user = User.find_by(email: params[:email]) # it's looking up the email key and passing the param entered in the email
    # Authenticate (not the same as validate) - through email/password combo
    if @user.authenticate(params[:password])
      session[:your_session] = @user.id
      redirect "projects/#{@user.id}"
    else
      redirect '/signup'
    end
  end

  #routes necessary for signup

  get '/signup' do
    erb :signup
  end

  post '/projects' do
    if params[:username] != "" && params[:first_name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      redirect "/projects/#{@user.id}"
      erb :'/projects/index'
    else
      redirect '/signup'
    end
  end

  #projects for a user (same as SHOW)
  get '/projects/:id' do
    "this will be the users project index"
  end

end
