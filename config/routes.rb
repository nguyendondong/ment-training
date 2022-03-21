Rails.application.routes.draw do
  root "posts#index"
  resources :users
  devise_scope :user  do
    get "user/signin" => "devise/sessions#new"
    post "user/signin" => "devise/sessions#create"
    delete "user/signout" => "devise/sessions#destroy"
  end
  resources :posts
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
