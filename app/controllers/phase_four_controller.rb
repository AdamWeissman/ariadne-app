class PhaseFourController < ApplicationController

  get '/phase_4/:the_project_id' do
      if logged_in?
        @user = current_user
        @project = Project.find(params[:the_project_id])
        if authenticated_project?
          erb :"/user_is_logged_in/phase_4/phase_4_first_iteration"
        else
        redirect '/no_access'
        end

      else
        redirect '/no_access'
      end
    end

  patch '/phase_4/:the_project_id' do
      if logged_in?
        @user = current_user
        @project = Project.find(params[:the_project_id])
        if authenticated_project?
          @project.tasks.order(:base_rank).each do |task|
            task.base_rank += 1.0
            task.save
          end
          redirect :"/phase_4/#{@project.id}"
        else
        redirect '/no_access'
        end

      else
        redirect '/no_access'
      end
    end

#below this line in process

  patch '/phase_4_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      if authenticated_project?
        @tasks = []
        @project.tasks.order(:base_rank).each do |task|
          @tasks << task
        end

        @user_rankings = []
        params[:project][:tasks].each do |task|
          @user_rankings << task[:user_rank]
        end

        @tasks.zip(@user_rankings).each do |the_task, the_user_ranking|
          the_task.user_rank = "#{the_user_ranking}"
          the_task.save
        end

        @project.current_phase = 4
        @project.save

        redirect "/phase_4_complete_with_data/#{@project.id}"

      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

    get '/phase_4_complete_with_data/:the_project_id' do
      if logged_in?
        @user = current_user
        @project = Project.find(params[:the_project_id])
        if authenticated_project?
          erb :"/user_is_logged_in/phase_4/phase_4_complete_with_data"
        else
        redirect '/no_access'
        end
      else
        redirect '/no_access'
      end
    end




end
