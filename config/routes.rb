Rails.application.routes.draw do
  
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope :api, defaults: { format: 'json' } do
    devise_for :admin, 
    controllers: { 
      registrations: 'admin/registrations',
      sessions: 'admin/sessions' }
end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :sectors
      resources :users
    end
  end

end
