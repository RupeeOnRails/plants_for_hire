Rails.application.routes.draw do
  get 'map/index'

  get 'map/list'

  get 'map', to: 'map#index'

  root to: 'map#list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
