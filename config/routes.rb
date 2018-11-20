Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  resources :nationalities, only: %i[index show] do
    resources :payloads, only: [:index]
    resources :missions, only: [:index]
  end

  resources :payloads, only: %i[show index]
  resources :missions, only: %i[show index] do
    collection do
      get 'search'
    end
  end

  get 'fetch_data', to: 'home#fetch_all'
  get 'info', to: 'home#info'
end
