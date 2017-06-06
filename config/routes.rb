Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users

  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
