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

end
