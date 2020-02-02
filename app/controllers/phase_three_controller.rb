class PhaseThreeController < ApplicationController

  get '/phase_3/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_3/phase_3_first_iteration"
    else
      redirect '/no_access'
    end
  end

  patch '/phase_3_segments_complete/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])

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
  end

  get '/phase_3_segments_complete/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_3/phase_3_segments_complete"
    else
      redirect '/no_access'
    end
  end

# YOU'RE WORKING ABVOE THIS LINE



  patch '/phase_3_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])

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
  end

  get '/phase_3_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_3/phase_3_complete_with_data"
    else
      redirect '/no_access'
    end
  end

end
