class UsersController < ApplicationController

  #route necessary for login
  get '/login' do
    erb :login
  end

  #this route receives the login form, finds the user and logs the user in
  #it creates a session
  post '/login' do
    erb :login
  end

  #routes necessary for signup

  get '/signup' do
    erb :signup
  end

end
