class UsersController < ApplicationController

  #routes necessary for login
  get '/login' do
    erb :login
  end

  #routes necessary for signup

  get '/signup' do
    erb :signup
  end

end
