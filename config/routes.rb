Rails.application.routes.draw do

 devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
 }

 devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_up", :to => "users/registrations#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :users, only:[:show, :edit, :update]

  resources :posts, only:[:new, :show, :create, :index, :destroy ]

  resources :images

  resources :follows

  resources :favorits

  resources :comments



end
