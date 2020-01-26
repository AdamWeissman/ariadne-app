class PhaseTwoController < ApplicationController

  get '/phase_2/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find_by(project_id: params[:project_id], comment_or_measure: "you must change this to continue.")
      if @task.blank?
        @task = Task.find_by(project_id: params[:project_id])
        @project = Project.find(params[:project_id])
        redirect "/phase_2_question_time/#{@project.id}/#{@task.id}"
      else
        erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
      end
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
      TaskScore.find_or_create_by(task_id: @task.id, necessary_or_optional_for_form_rendering: "unknown", quick_or_slow_for_form_rendering: "unknown", easy_or_hard_for_form_rendering: "unknown")
      redirect "/phase_2/#{@project.id}"
    else
      redirect '/no_access'
    end
  end

  # these two sort of work...

  get '/phase_2_question_time/:project_id/:task_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:task_id])
      @task_score = TaskScore.find_by(task_id: params[:task_id], necessary_or_optional_for_form_rendering: "unknown", quick_or_slow_for_form_rendering: "unknown", easy_or_hard_for_form_rendering: "unknown")
      erb :'/inside_the_maze/adventures/phase_2/phase_2_question_time'
      if @task_score.blank?
        redirect "/projects"
      else
        erb :'/inside_the_maze/adventures/phase_2/phase_2_question_time'
      end
    else
      redirect '/no_access'
    end
  end

patch '/phase_2_question_time/:project_id/:task_id/:task_score_id' do
  if logged_in?
    @user = current_user
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @task_score = TaskScore.find_by(params[:task_score_id])
    @task_score.necessary_or_optional_for_form_rendering = params[:necessary_or_optional_for_form_rendering]
    @task_score.quick_or_slow_for_form_rendering = params[:quick_or_slow_for_form_rendering]
    @task_score.easy_or_hard_for_form_rendering = params[:easy_or_hard_for_form_rendering]
    @task_score.save
    redirect "/phase_2_question_time_work_around/#{@project.id}/#{@task.id}"
  else
    redirect '/no_access'
  end
end

get '/phase_2_question_time_work_around/:project_id/:task_id' do
  if logged_in?
    @user = current_user
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @task_score = TaskScore.find_by(task_id: params[:task_id], necessary_or_optional_for_form_rendering: "unknown", quick_or_slow_for_form_rendering: "unknown", easy_or_hard_for_form_rendering: "unknown")
    erb :'/inside_the_maze/adventures/phase_2/phase_2_question_time'
    if @task_score.blank?
      redirect "/projects"
    else
      erb :'/inside_the_maze/adventures/phase_2/phase_2_question_time'
    end
  else
    redirect '/no_access'
  end
end



end
