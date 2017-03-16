Rails.application.routes.draw do

  get '/static_pages/about', to: 'static_pages#about'
  get '/static_pages/help', to: 'static_pages#help'
  get '/static_pages/privacy_policy', to: 'static_pages#privacy_policy'
  get '/static_pages/report_problem', to: 'static_pages#report_problem'

  devise_for :users, controllers: {registrations: :registrations}

  resources :advertisements do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :groups do
    resources :people
    resources :publications
    resources :awards
    resources :courses
    resources :researches
  end

  resources :stories do
    resources :comments
  end
  
  resources :yearbooks
  resources :users
  resources :notifications
  resources :feedbacks

  root 'stories#index'
end
