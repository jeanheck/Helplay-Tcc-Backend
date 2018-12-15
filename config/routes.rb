Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :eventos, only: [:show, :index]

  resources :usuarios do
    resources :amigos, only: [:show, :index, :create, :destroy]
    resources :eventos do
      resources :participantes, only: [:show, :index, :create, :destroy]
    end
    resources :atividades, only: [:show, :index, :create, :destroy] do
      resources :individualidades, only: [:show, :index, :create, :destroy]
    end
  end
  resources :esportes, only: [:show, :index] do
    resources :caracteristicas, only: [:create, :show, :index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
