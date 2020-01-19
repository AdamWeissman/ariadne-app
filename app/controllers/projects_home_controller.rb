class ProjectsHomeController < ApplicationController

  get '/projects' do
    if logged_in?
      @user = current_user
      erb :'/inside_the_maze/adventures/projects_home'
    else
      redirect '/no_access'
    end
  end

  get '/create_a_new_project' do
    if logged_in?
      @user = current_user
      erb :'/inside_the_maze/adventures/new_project'
    else
      redirect '/no_access'
    end
  end

  post '/create_a_new_project' do
    @user = current_user
    @project = Project.create(params)
    redirect "/phase_1_preview/#{@project.id}"
  #erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
  end

  #ABOVE THIS COMMENT WORKS, BELOW THIS COMMENT DOES NOT

  get '/delete_a_project/' do
    if logged_in?
      @user = current_user
      @project = current_user.projects.find_by_id(id params[:id])
      erb :'/inside_the_maze/adventures/delete_a_project'
    else
      redirect '/no_access'
    end
  end

  delete '/delete_a_project_for_real/:id' do
    if logged_in?
      @user = current_user
      @project = current_user.projects.find_by_id(params[:id])
      @project.destroy
      erb :'/inside_the_maze/adventures/delete_a_project_for_real'
    else
      redirect '/no_access'
    end
  end

  get '/edit_a_project/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      if @project.current_phase.to_i == 1
        redirect "/phase_1_preview/#{@project_id}"
      elsif @project.current_phase.to_i == 2
        redirect '/phase_2_preview/:id'
      elsif @project.current_phase.to_i == 3
        redirect '/phase_3_preview/:id'
      elsif @project.current_phase.to_i == 4
        redirect '/phase_4_preview/:id'
      elsif @project.current_phase.to_i == 5
        redirect '/phase_5_preview/:id'
      end
    else
      redirect '/no_access'
    end
  end

  get '/edit_a_project' do
    if logged_in?
      erb :'/inside_the_maze/adventures/edit_a_project'
    else
      redirect '/no_access'
    end
  end


    #post '/phase_1_preview' do
    #  if logged_in?
    #    @user = current_user
    #    redirect "/phase_1_preview/#{@project.id}"
    #  else
    #    redirect '/no_access'
    #  end
    #end


end
