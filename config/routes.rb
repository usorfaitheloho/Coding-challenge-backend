Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'static/index'
  namespace :v1, defaults: { format: 'json' } do
    get 'sectors', to: 'sectors#index'
  end

  root 'static#index'

end
