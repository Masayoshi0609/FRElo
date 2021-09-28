Rails.application.routes.draw do

  root to: "homes#index"
  get "/body_type" => "homes#type"
  get "/welcome" => "homes#welcome"
  get "judge" => "homes#judge"

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

  devise_scope :user do
    get 'mypage' => 'follow_timelines#show'
  end

  resources :posts, only: [:create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :create] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => 'relationships#followings', as: "followings"
    get "followers" => 'relationships#followers', as: "followers"
    resource :home_timelines, only: [:show]
    resource :hot_timelines, only: [:show]
    resource :follow_timelines, only: [:show]
  end

  resources :tags, only: [:show, :create] do
    get "posts", to: "posts#search"
  end

  get 'user_confirm' => "users#confirm"
  patch 'user_quit' => "users#quit"

  get "privacy_policy" => "homes#privacy"
  get "kiyaku" => "homes#kiyaku"

  get "search" => "searches#search"

end
