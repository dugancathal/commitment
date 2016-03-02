Rails.application.routes.draw do
  root to: 'home#index'
  resource :dashboard, only: [:show]
  get '/auth/:provider', to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/repos/:owner/:id', to: 'repos#show', as: :repo

  resources :repos, except: :show do
    resources :deployments
  end
end
