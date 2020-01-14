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

# NOW PROJECT STUFF
  get '/projects' do
    erb :'/a_bunch_of_fakes/fake_projects/fake_projects_home'
  end

  get '/new_project' do
    erb :'/a_bunch_of_fakes/fake_projects/new_project'
  end

  get '/old_project' do
    erb :'/a_bunch_of_fakes/fake_projects/fake_projects_home'
  end


end
