Social::Application.routes.draw do
  devise_for :users

  root 'home#index'

  # TODO: be sure only the needed routes are generated
  resources :posts

  resources :users do
    collection do
      post 'befriend'
    end
  end
  
end
