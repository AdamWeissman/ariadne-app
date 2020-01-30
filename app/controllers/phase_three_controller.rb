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

  patch '/phase_3_complete_with_data/:project_id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:project_id])
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
