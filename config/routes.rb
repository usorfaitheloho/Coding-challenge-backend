Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :sectors
    get 'sectors', to: 'sectors#index'
    end
  end

end
