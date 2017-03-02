Rails.application.routes.draw do
  get 'map/index'
  get 'map', to: 'map#index'

  get 'map/list'
  get 'list', to: 'map#list'

  get 'map/builder'
  get 'builder', to: 'map#builder'

  post 'update_map', to: 'map#update'

  get 'map/play'
  get 'play', to: 'map#play'

  root to: 'map#play'

  resources :locations

  resources :player
  get 'player/move/:location_id', to: 'player#move'
  get 'finish_day', to: 'player#finish_day', as: 'finish_day'

  get 'buy_from_location', to: 'player#buy_from_location'
  get 'sell_from_location', to: 'player#sell_from_location'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
