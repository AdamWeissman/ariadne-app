class PhaseTwoController < ApplicationController

  get '/phase_2/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find_by(project_id: params[:project_id], comment_or_measure: "you must change this to continue.")
      if @task.nil?
        redirect "/phase_2_question_time/#{@project.id}"
      else
        erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
      end
    else
      redirect '/no_access'
    end
  end

  patch '/phase_2/:project_id/:the_task_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:the_task_id])
      @task.comment_or_measure = params[:comment_or_measure]
      @task.save
      TaskScore.find_or_create_by(task_id: "#{@task.id}".to_i, necessary_or_optional_for_form_rendering: "unknown", quick_or_slow_for_form_rendering: "unknown", easy_or_hard_for_form_rendering: "unknown")
      redirect "/phase_2/#{@project.id}"
    else
      redirect '/no_access'
    end
  end

  # these two sort of work...

  get '/phase_2_question_time/:project_id/?:task_score_id?' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @phantom = TaskScore.find_by(params[:task_score_id])
      #@task = Task.find_by(project_id: params[:project_id])
      @task = Task.find_by(project_id: params[:project_id], golem: "questions incomplete")
      unless @task.nil?
        @task_score = TaskScore.find_by(task_id: "#{@task.id}".to_i) if ((@task.task_score.necessary_or_optional_for_form_rendering == "unknown") || (@task.task_score.quick_or_slow_for_form_rendering == "unknown") || (@task.task_score.easy_or_hard_for_form_rendering == "unknown"))
        erb :"/inside_the_maze/adventures/phase_2/phase_2_question_time"
      else
        redirect "/phase_2_complete/#{@project.id}"
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
      @task_score = TaskScore.find(params[:task_score_id])

      @task_score.necessary_or_optional_for_form_rendering = params[:necessary_or_optional_for_form_rendering]
        if @task_score.necessary_or_optional_for_form_rendering == "necessary"
          @task_score.necessary_or_optional_score = 0.0
        elsif @task_score.necessary_or_optional_for_form_rendering == "optional"
          @task_score.necessary_or_optional_score = 50.0
        else
          @task_score.necessary_or_optional_score = 25.0
        end

      @task_score.quick_or_slow_for_form_rendering = params[:quick_or_slow_for_form_rendering]
        if @task_score.quick_or_slow_for_form_rendering == "quick"
          @task_score.quick_or_slow_score = 1.0
        elsif @task_score.quick_or_slow_for_form_rendering == "slow"
          @task_score.quick_or_slow_score = 2.0
        else
          @task_score.quick_or_slow_score = 10.0
        end

      @task_score.easy_or_hard_for_form_rendering = params[:easy_or_hard_for_form_rendering]
        if @task_score.easy_or_hard_for_form_rendering == "easy"
          @task_score.easy_or_hard_score = 4.0
        elsif @task_score.easy_or_hard_for_form_rendering == "difficult"
          @task_score.easy_or_hard_score = 7.0
        else
          @task_score.easy_or_hard_score = 10.0
        end

      @task_score.save

      @task.calculated_rank = @task_score.easy_or_hard_score + @task_score.quick_or_slow_score + @task_score.necessary_or_optional_score
      @task.save

      if (@task_score.necessary_or_optional_for_form_rendering != "unknown") && (@task_score.quick_or_slow_for_form_rendering != "unknown") && (@task_score.easy_or_hard_for_form_rendering != "unknown")
        @task.golem = "questions complete"
        @project.current_phase = 2
        @project.save
        @task.save
      else
        @task.golem = "questions incomplete"
        @task.save
      end
      redirect "/phase_2_question_time/#{@project.id}/#{@task_score.id}"
    else
      redirect '/no_access'
    end
  end

  get '/phase_2_complete/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      erb :"/inside_the_maze/adventures/phase_2/phase_2_complete_with_data"
      # better to just redirect to phase 3... especially if all data is populating
    else
      redirect '/no_access'
    end
  end

end
