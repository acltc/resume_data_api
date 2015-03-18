Rails.application.routes.draw do

  # get '/students' => 'students#index'
  # get '/students/new' => 'students#new'
  get '/students/:id' => 'students#show', :as => :student
  patch '/students/:id' => 'students#update'

 
  get '/skills/:id' => 'skills#show', :as => :skill
  post '/skills' => 'skills#create'
  patch '/skills/:id' => 'skills#update'
  delete '/skills/:id' => 'skills#delete'


  get '/educations/:id' => 'educations#show', :as => :education
  post '/educations' => 'educations#create'
  patch '/educations/:id' => 'educations#update'
  delete '/educations/:id' => 'educations#delete'
  

  get '/experiences/:id' => 'experiences#show', :as => :experience
  post '/experiences' => 'experiences#create'
  patch '/experiences/:id' => 'experiences#update'
  delete '/experiences/:id' => 'experiences#delete'
  
  
  get '/education_details/:id' => 'education_details#show', :as => :education_detail
  post '/education_details' => 'education_details#create'
  patch '/education_details/:id' => 'education_details#update'
  delete '/education_details/:id' => 'education_details#delete' 


  get '/experience_details/:id' => 'experience_details#show', :as => :experience_detail
  post '/experience_details' => 'experience_details#create'
  patch '/experience_details/:id' => 'experience_details#update'
  delete 'experience_details/:id' => 'experience_details#delete'


  get '/references/:id' => 'references#show', :as => :reference
  post '/references' => 'references#create'
  patch '/references/:id' => 'references#update'
  delete 'references/:id' => 'references#delete'
end
