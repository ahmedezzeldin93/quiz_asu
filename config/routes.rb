Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'
  get 'api', to: 'welcome#index'

  devise_for :users

  namespace :api do
    devise_scope :user do
      post 'users/registrations' => 'registrations#create', :as => 'register'
      post 'users/sessions' => 'sessions#create', :as => 'login'
      delete 'users/sessions' => 'sessions#destroy', :as => 'logout'
    end
    resources :users
    resources :quizzes
    resources :assignments
    resources :answers
    resources :questions  
    resources :groups
    resources :memberships
  end

end