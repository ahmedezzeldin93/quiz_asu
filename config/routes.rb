Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'
  get 'api', to: 'welcome#index'

  devise_for :users

  namespace :api do
    devise_scope :user do
      post 'users/registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
    resources :users
    resources :answers
    resources :questions
    resources :quizzes
    resources :groups
    resources :memberhsips
  end

end