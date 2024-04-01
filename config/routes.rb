Rails.application.routes.draw do
  get 'sessions/create'
  get "/tasks/all", to: "tasks#index_all", as: :all_tasks
  get "/reviews/all", to: "reviews#index_all", as: :all_reviews
  get "/daily_plans/all", to: "daily_plans#index_all", as: :all_daily_plans
  get "up" => "rails/health#show", as: :rails_health_check
  post "/login", to: "sessions#create"

  
  resources :users, shallow: true do
    resources :tasks, only: [:index, :create] do
      resources :reviews, only: [:create, :index]
    end
    resources :daily_plans, only: [:index, :create]
  end

  resources :tasks, except: [:index, :create] do
    resources :time_entries, only: [:create]
    resources :reviews, except: [:create, :index]
  end

  resources :time_entries, only: [:show, :update, :destroy]
  resources :reviews, except: [:index, :create]
  resources :daily_plan_tasks, only: [:create, :destroy, :index]
end
