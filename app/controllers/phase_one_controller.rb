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
    @project.the_initial_blob_to_parse.scan(/\b(t:)(.*?)(:e)\b/i).each do |the_task, the_content, the_end|
      @array_of_tasks = []
      @array_of_tasks << the_content.to_s
      @array_of_tasks.each do |x|
        Task.create(:the_action_description => "#{x}")
      end
    end
    erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
  end

  get '/phase_1_saved/:id' do
      @user = current_user
      @project_tasks = Project.find(params[:id]).tasks
      erb :'/inside_the_maze/adventures/phase_1/phase_1_complete_with_data'
  end

end
