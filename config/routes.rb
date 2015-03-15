Rails.application.routes.draw do

  get '/students' => 'stundents#index'
  get '/stundents/:id' => 'students#show', :as => :student
  get '/stunden'
end
