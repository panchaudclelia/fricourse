Rails.application.routes.draw do
  resources :recommendations
  resources :study_paths
  resources :courses
  resources :course_modules
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'static#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
