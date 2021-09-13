Rails.application.routes.draw do

  root to: "homes#index"
  get "/body_type" => "homes#type"
  get "/welcome" => "homes#welcome"
  devise_for :users

  resources :posts, only: [:create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit] do
    resource :relationships, only: [:create, :destroy]
    get "following" => 'relationships#following', as: "following"
    get "followed" => 'relationships#followed', as: "followed"
    resource :home_timelines, only: [:show]
    resource :hot_timelines, only: [:show]
    resource :buddy_timelines, only: [:show]
    resource :follow_timelines, only: [:show]
    resources :bookmarks, only: [:index]
  end



  resources :tags, only: [:show, :create]

  get 'users/:id/confirm' => "users#confirm"
  get 'users/:id/quit' => "users#quit"

end
