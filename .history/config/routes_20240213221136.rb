Rails.application.routes.draw do
  get 'daily_plans/index'
  get 'daily_plans/show'
  get 'daily_plans/create'
  get 'daily_plans/update'
  get 'daily_plans/destroy'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/create'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'time_entries/index'
  get 'time_entries/show'
  get 'time_entries/create'
  get 'time_entries/update'
  get 'time_entries/destroy'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
