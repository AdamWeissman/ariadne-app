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
      session[:work_hard] = @user.id
      redirect "users/#{@user.id}"
    else

    end
  end

  #routes necessary for signup

  get '/signup' do
    erb :signup
  end

  #user SHOW route
  get '/users/:id' do
    "this will be the users show route"
  end

end
