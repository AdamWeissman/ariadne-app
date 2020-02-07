class PhaseThreeController < ApplicationController

  get '/phase_3/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      if authenticated_project?
        erb :"/user_is_logged_in/phase_3/phase_3_first_iteration"
      else
        redirect '/no_access'
      end
    else
      redirect '/no_access'
    end
  end

  patch '/phase_3_segments_complete/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      if authenticated_project?

        @tasks = []
        @project.tasks.order(:calculated_rank).each do |task|
          @tasks << task
        end

        @segments = []
        params[:project][:tasks].each do |seg_val|
          @segments << seg_val[:segment]
        end

        @tasks.zip(@segments).each do |the_task, the_segment|
          the_task.segment = "#{the_segment}"
          the_task.save
        end

        @project.tasks.order(:segment).order(:calculated_rank).each_with_index do |task, index|
          task.base_rank = index.to_f
          task.save
        end

        @project.current_phase = 3
        @project.save

        redirect "/phase_3_segments_complete/#{@project.id}"

      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  get '/phase_3_segments_complete/:the_project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:the_project_id])
      if authenticated_project?
        @project.tasks.each do |x|
          if x.the_action_description != "THIS IS YOUR NEW TASK"
            x.calculated_rank += 100.0
            x.save
          else
            x.save
          end
        end
        @project.tasks.order(:segment).order(:calculated_rank).each_with_index do |task, index|
          task.base_rank = index.to_f
          task.save
        end
        erb :"/user_is_logged_in/phase_3/phase_3_segments_complete"
      else
      redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end


  delete '/phase_3_segments_complete/:the_task_id/:the_project_id' do
    if logged_in?
      @user = current_user
      @task = Task.find(params[:the_task_id])
      @project = Project.find(params[:the_project_id])
      if authenticated_project?
        @task.destroy
        @project.tasks.order(:segment).order(:calculated_rank).each_with_index do |task, index|
          task.base_rank = index.to_f
          task.save
        end
        redirect "/phase_3_segments_complete/#{@project.id}"
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  patch '/phase_3_segments_saved/:the_task_id/:the_project_id' do
    if logged_in?
      @user = current_user
      @task = Task.find(params[:the_task_id])
      @project = Project.find(params[:the_project_id])
      if authenticated_project?
        @task.the_action_description = params[:the_action_description]
        @task.save
        @project.save
        erb :"/user_is_logged_in/phase_3/phase_3_segments_complete"
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  post '/phase_3_segments_complete/:scrubadub' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:scrubadub])
      if authenticated_project?
        Task.find_or_create_by(params.except!(:scrubadub))
        redirect "/phase_3_segments_complete/#{@project.id}"
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end


# BELOW THIS LINE WORKS, BUT IS NOT BEING USED... THE SEGMENTS COMPLETE ITERATION HAS REPLACED IT.  COMPLETE WITH DATA WILL BE USEFUL FOR BEING ABLE TO EDIT FROM PROJECTS HOME.



  patch '/phase_3_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      if authenticated_project?

        @tasks = []
        @project.tasks.order(:calculated_rank).each do |task|
          @tasks << task
        end

        @segments = []
        params[:project][:tasks].each do |seg_val|
          @segments << seg_val[:segment]
        end

        @tasks.zip(@segments).each do |the_task, the_segment|
          the_task.segment = "#{the_segment}"
          the_task.save
        end

        @project.current_phase = 3
        @project.save

        redirect "/phase_3_complete_with_data/#{@project.id}"
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

  get '/phase_3_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      if authenticated_project?
        erb :"/user_is_logged_in/phase_3/phase_3_complete_with_data"
      else
        redirect '/no_access'
      end

    else
      redirect '/no_access'
    end
  end

end
