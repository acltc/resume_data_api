Rails.application.routes.draw do

  # get '/students' => 'students#index'
  # get '/students/new' => 'students#new'
  get '/students/:id' => 'students#show', :as => :student
  patch '/students/:id' => 'students#update'


  post '/skills' => 'skills#create'
  patch '/skills/:id' => 'skills#update'
  delete '/skills/:id' => 'skills#delete'


  post '/educations' => 'educations#create'
  patch '/educations/:id' => 'educations#update'
  delete '/educations/:id' => 'educations#delete'
  

  post '/experiences' => 'experiences#create'
  patch '/experiences/:id' => 'experiences#update'
  delete '/experiences/:id' => 'experiences#delete'


  
end
