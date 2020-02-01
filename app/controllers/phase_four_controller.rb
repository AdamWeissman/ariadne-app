class PhaseFourController < ApplicationController

  get '/phase_4/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_4/phase_4_first_iteration"
    else
      redirect '/no_access'
    end
  end

  #below this line is incomplete

  patch '/phase_4_complete_with_data/:project_id' do
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

      #@tasks.zip @segments

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

  get '/phase_4_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_3/phase_3_complete_with_data"
    else
      redirect '/no_access'
    end
  end

end
