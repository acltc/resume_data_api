Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students
      resources :experiences
      resources :educations
      resources :proffessional_skills
      resources :personal_skills
      resources :references
    end
  end
  resources :personal_informations
  resources :profiles
  resources :experiences
  resources :educations
  resources :proffessional_skills
  resources :personal_skills
  resources :references
  resources :users
end