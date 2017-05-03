Rails.application.routes.draw do
  resources :courses
  resources :study_paths
  resources :study_modules
  devise_for :users
  root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
