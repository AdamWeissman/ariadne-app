class ProjectsHomeController < ApplicationController

  get '/projects' do
    if logged_in?
      @user = current_user
      erb :'/user_is_logged_in/projects_home'
    else
      redirect '/no_access'
    end
  end

  get '/create_a_new_project' do
    if logged_in?
      @user = current_user
      erb :'/user_is_logged_in/new_project'
    else
      redirect '/no_access'
    end
  end

  post '/create_a_new_project' do
    @user = current_user
    @project = Project.create(params)
    redirect "/phase_1_preview/#{@project.id}"
  end

  get '/delete_a_project/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      if authenticated_project?
        erb :'/user_is_logged_in/delete_a_project'
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  delete '/delete_a_project_for_real/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      if authenticated_project?
        @project.destroy
        redirect '/projects'
      else
       redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  get '/edit_a_project/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      if authenticated_project?
        if @project.current_phase == 1
          redirect "/phase_1_saved/#{@project.id}"
        elsif @project.current_phase == 2
          redirect "/phase_2_complete/#{@project.id}"
        elsif @project.current_phase == 3
          redirect "/phase_2_complete/#{@project.id}"
        else
          redirect "/projects"
        end
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end



end
