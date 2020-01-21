class PhaseOneController < ApplicationController

  patch '/update_in_place/:id' do
    @user = current_user
    @project = Project.find(params[:id])
    #@project = Project.find_by(user: params[:user_id], id: params[:project_id])
    @project.project_name = params[:project_name]
    @project.project_summary = params[:project_summary]
    #@project.the_initial_blob_to_parse = params[:the_initial_blob_to_parse]
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

#below this line currently does not work.

  get '/phase_1_preview_something_sucked_let_me_fix_it' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_1/phase_1_fix_the_preview'
    else
      redirect '/no_access'
    end
  end

end
