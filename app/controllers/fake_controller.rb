class FakeController < ApplicationController

#logged in is fake_account_home, logged out is fake_start

  get '/fake_account_home' do
    erb :fake_account_home
  end

#logged out is sans the numeral ... if there's a 2 it means logged in

  get '/fake_about' do
    erb :'/a_bunch_of_fakes/the_fake_about'
  end

  get '/fake_about2' do
    erb :'/a_bunch_of_fakes/the_fake_about2'
  end

# these three are related

  get '/fake_login' do
    erb :'/a_bunch_of_fakes/the_fake_login'
  end

  get '/fake_signup' do
    erb :'/a_bunch_of_fakes/the_fake_signup'
  end

  get '/fake_logout' do
    erb :'/a_bunch_of_fakes/the_fake_logout'
  end

# CONTACT is only available if you are logged in
  get '/fake_contact' do
    erb :'/a_bunch_of_fakes/the_fake_contact'
  end

# PROJECT STUFF MAIN MENU
  get '/projects' do
    erb :'/a_bunch_of_fakes/fake_projects/fake_projects_home'
  end

  get '/create_a_new_project' do
    erb :'/a_bunch_of_fakes/fake_projects/new_project'
  end

  get '/edit_a_project' do
    erb :'/a_bunch_of_fakes/fake_projects/edit_a_project'
  end

  get '/delete_a_project' do
    erb :'/a_bunch_of_fakes/fake_projects/delete_a_project'
  end

  get '/delete_a_project_for_real' do
    erb :'/a_bunch_of_fakes/fake_projects/delete_a_project_for_real'
  end

# PROJECT STUFF PHASE I (NEW PROJECT) -- starts with create_a_new_project

  get '/phase_1_preview' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_1/the_phase_1_preview'
  end

  get '/phase_1_saved' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_1/phase_1_complete_with_data'
  end

  get '/phase_1_preview_something_sucked_let_me_fix_it' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_1/phase_1_fix_the_preview'
  end

# PHASE II

  get '/phase_2' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_2/phase_2_first_iteration'
  end

  get '/phase_2_saved' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_2/phase_2_complete_with_data'
  end

# PHASE III

  get '/phase_3' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_3/phase_3_first_iteration'
  end

  get '/phase_3_saved' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_3/phase_3_complete_with_data'
  end

# PHASE IV

  get '/phase_4' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_4/phase_4_first_iteration'
  end

  get '/phase_4_saved' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_4/phase_4_complete_with_data'
  end

# PHASE V YOU ARE HERE...

  get '/phase_5' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_5/phase_5_first_iteration'
  end

  get '/phase_5_saved' do
    erb :'/a_bunch_of_fakes/fake_projects/phase_5/phase_5_complete_with_data'
  end


end
