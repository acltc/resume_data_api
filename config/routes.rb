Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
     authenticated :user do
       root 'profiles#edit', as: :authenticated_root
     end
  unauthenticated do
       root 'devise/sessions#new', as: :unauthenticated_root
     end
   end
  
  get '/:full_name' => 'profiles#show'
  # root 'profiles#edit'

  namespace :api do
    namespace :v1 do
      resources :students
      resources :experiences
      resources :experience_details
      resources :educations
      resources :education_details
      resources :proffessional_skills
      resources :personal_skills
      resources :references
    end
  end
  resources :personal_informations
  resources :profiles
  resources :experiences
  resources :educations
  resources :professional_skills
  resources :personal_skills
  resources :references
  resources :users
  resources :students
end