class PhaseTwoController < ApplicationController

  get '/phase_2/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find_by(project_id: params[:project_id], comment_or_measure: "you must change this to continue.")
      erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
    else
      redirect '/no_access'
    end
  end

  patch '/phase_2/:project_id/:task_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:task_id])
      @task.comment_or_measure = params[:comment_or_measure]
      @task.save
      redirect "/phase_2/#{@project.id}"
    else
      redirect '/no_access'
    end
  end

#BELOW HERE NOT WORKING

  get '/phase_2_saved' do
    if logged_in?
      erb :'/inside_the_maze/adventures/phase_2/phase_2_complete_with_data'
    else
      redirect '/no_access'
    end
  end
end
