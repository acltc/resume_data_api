Rails.application.routes.draw do

  get '/students' => 'students#index'
  get '/students/new' => 'students#new'
  get '/students/:id' => 'students#show', :as => :student
  patch '/photos/:id' => 'students#show'

end
