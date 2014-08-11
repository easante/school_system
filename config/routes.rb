Rails.application.routes.draw do

  root 'dashboard#index'

  get '/setup', to: 'setup#index', as: 'setup'

  resources :school_years, only: [:new, :create, :show]

end
