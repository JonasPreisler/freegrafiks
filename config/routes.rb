Rails.application.routes.draw do
  resources :categories
  devise_for :users
  devise_for :models
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
  end
  resources :tags

  get ':name' => 'users#show', as: 'user'

  root 'posts#index'

  get 'post/new'

end
