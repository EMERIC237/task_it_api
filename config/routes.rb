Rails.application.routes.draw do
  get "/tasks/all", to: "tasks#index_all", as: :all_tasks
  get "/reviews/all", to: "reviews#index_all", as: :all_reviews
  get "/daily_plans/all", to: "daily_plans#index_all", as: :all_daily_plans
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, shallow: true do
    resources :tasks, only: [:index, :create]
    resources :reviews, only: [:index]
    resources :daily_plans, only: [:index, :create]
  end

  resources :tasks, except: [:index, :create] do
    resources :time_entries, only: [:create]
  end

  resources :time_entries, only: [:show, :update, :destroy]
  resources :reviews, except: [:index]
  resources :daily_plan_tasks, only: [:create, :destroy, :index]
end
