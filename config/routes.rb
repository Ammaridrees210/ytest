Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "registrations" }

  
  namespace :users do
    resources :tweets do
      # collection do
      #     get :all_tweets
      # end
    end
  end

  # resources :users do
  #   resources :tweets
  # end

  resources :tweets, only: [:index]



  root to: "tweets#index"


  get "profile", to: "tweets#profile", as: :user_profile
end
