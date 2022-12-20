Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :posts do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

  # get '/posts', to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

