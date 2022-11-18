Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "emotions#index"
  resources :emotions, only: [:index, :new, :create, :destroy, :show] do
    member do
      put 'like'
    end
  end
end
