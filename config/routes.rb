Rails.application.routes.draw do
  get 'map/index'
  get 'map', to: 'map#index'

  get 'map/list'
  get 'list', to: 'map#list'

  get 'map/builder'
  get 'builder', to: 'map#builder'

  post 'update_map', to: 'map#update'

  root to: 'map#list'

  resources :locations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
