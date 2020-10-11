Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users#, only: [:new, :create, :show, :edit]
  resources :favorites, only: [:create, :destroy]
  resources :blogs do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
  get "users/:id/favorites" => "users#favorites"
  get "/" => "blogs#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # post "users/:id/update" => "users#update"
  # get "users/:id/edit" => "users#edit"
  # post "users/:id/edit" => "users#edit"
  # patch "users/:id" => "users#update"
end
