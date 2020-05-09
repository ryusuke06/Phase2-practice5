Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    get 'follows'
    get 'followers'
  end
  resources :books do
  	resources :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  root 'home#top'
  get 'home/about'

  get '/search', to: 'search#search'

end