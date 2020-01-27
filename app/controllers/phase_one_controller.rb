class PhaseOneController < ApplicationController

  get '/phase_1_preview/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
    else
      redirect '/no_access'
    end
  end

  get '/phase_1_preview_something_sucked_let_me_fix_it/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      erb :'/inside_the_maze/adventures/phase_1/phase_1_fix_the_preview'
    else
      redirect '/no_access'
    end
  end

  patch '/phase_1_preview/:id' do
    @user = current_user
    @project = Project.find(params[:id])
    @project.project_name = params[:project_name]
    @project.project_summary = params[:project_summary]
    @project.the_initial_blob_to_parse = params[:the_initial_blob_to_parse]
    @project.save
    erb :'/inside_the_maze/adventures/phase_1/the_phase_1_preview'
  end

  post '/phase_1_saved/:id' do
    @user = current_user
    @project = Project.find(params[:id])
    @array_of_unmade_tasks = @project.the_initial_blob_to_parse.scan(/\b(t:)(.*?)(:e)\b/i).collect do |the_task, the_content, the_end|
      @array_of_tasks_to_be = []
      @array_of_tasks_to_be << the_content.to_s
    end
    @array_of_unmade_tasks.each do |make_this_a_task|
      Task.find_or_create_by(project_id: @project.id, the_action_description: "#{make_this_a_task}", comment_or_measure: "you must change this to continue.", golem: "questions incomplete")
    end

    erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
  end

  get '/phase_1_saved/:id' do
      @user = current_user
      @project = Project.find(params[:id])
      if @project.tasks.count >= 1
        erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
      else
        redirect '/projects'
      end
  end

  delete '/phase_1_saved/:task_id/:project_id' do
    if logged_in?
      @user = current_user
      @task = Task.find(params[:task_id])
      @project = Project.find(params[:project_id])
      @task.destroy
      erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
    else
      redirect '/no_access'
    end
  end

  patch '/phase_1_saved/:task_id/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:task_id])
      @task.the_action_description = params[:the_action_description]
      @task.comment_or_measure = params[:comment_or_measure]
      @task.save
      erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
    else
      redirect '/no_access'
    end
  end

  post '/phase_1_task_add/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
      Task.find_or_create_by(params)
      redirect "/phase_1_saved/#{@project.id}"
    else
      redirect '/no_access'
    end
  end


end
