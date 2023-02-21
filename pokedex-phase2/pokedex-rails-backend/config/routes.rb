Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :api, defaults: { format: :json } do
    
    resources :pokemon, only: [:index, :create, :update, :show, :types] do
      # get '/api/pokemon/types', to: 'api/pokemon#types', defaults: { format:  'json' }
      get 'types', on: :collection
      resources :items, only: [:index, :create]
    end
    resources :items, only: [:update, :destroy]
  end
  
end
