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

end
