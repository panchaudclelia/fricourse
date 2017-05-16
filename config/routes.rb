Rails.application.routes.draw do
  resources :recommendations
  resources :study_paths
  resources :courses 
  resources :course_modules 
  devise_for :users
  root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
