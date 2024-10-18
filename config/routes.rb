Rails.application.routes.draw do

  resources :users, only: [:index, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :update, :edit ,:destroy]
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: "about"
  get 'users/:id' => 'users#show' , as: "user_show"
  # get 'books' => 'books#index', as: "index_books"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
