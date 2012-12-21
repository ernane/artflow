Artflow::Application.routes.draw do
  devise_for :clients
  devise_for :designers
  devise_for :users

  resources :campaigns
  resources :clients
  resources :comments
  resources :creations do
    member do
      get 'permissions'
    end
  end
  resources :designers
  resources :plans
  resources :projects
  resources :project_assignments
  resources :subscriptions

  root :to => 'pages#home'
end
