Rails.application.routes.draw do

  get '/students' => 'stundents#index'
  get '/students/new' => 'students#new'
  get '/students/:id' => 'students#show', :as => :student
end
