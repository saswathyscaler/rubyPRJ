Rails.application.routes.draw do
  devise_for :user1s
  devise_for :users

    # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  # get 'students/new'


  resources:students

  resources :posts


  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
    end
  end
  







  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "posts#index"
end
