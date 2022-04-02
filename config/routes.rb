Rails.application.routes.draw do
  resources :products
  scope "(:locale)", locale: /en|vi/ do
    devise_scope :user  do
      get "user/signin" => "devise/sessions#new"
      post "user/signin" => "devise/sessions#create"
      delete "user/signout" => "devise/sessions#destroy"
    end
    namespace :admin do
      resources :posts 
      resources :users
      get '/dashboards/', to: 'dashboards#index'
      get '/', to: 'dashboards#index'
      resources :products
    end
    root "homes#index"
    resources :posts 
  end
  resources :csv, only: [:create]
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
