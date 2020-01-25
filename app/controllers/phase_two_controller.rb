class PhaseTwoController < ApplicationController

  get '/phase_2/:id' do
    if logged_in?
      @user = current_user
      @project = Project.find(params[:id])
      erb :'/inside_the_maze/adventures/phase_2/phase_2_first_iteration'
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
