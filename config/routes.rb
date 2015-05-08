Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students
    end
  end
  resources :personal_informaions
  resources :profiles
  resources :experiences
  resources :educations
  resources :proffessional_skills
  resources :personal_skills
  resources :references
end
