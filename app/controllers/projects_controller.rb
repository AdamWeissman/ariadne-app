class ProjectsController < ApplicationController

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
    @user = User.find_by(id: params[:id])
    erb :'/projects/index'
  end

end
