Rails.application.routes.draw do

  root 'dashboard#index'

  get '/setup', to: 'setup#index', as: 'setup'

  resources :school_years do
    resources :school_terms
  end

end
