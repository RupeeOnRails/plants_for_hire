Rails.application.routes.draw do
  devise_for :players
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
  # devise_scope :player do
    # root to: "devise/sessions#new"
  # end
  resources :locations

  get 'player/move/:location_id', to: 'player#move'
  get 'finish_day', to: 'player#finish_day', as: 'finish_day'

  get 'buy_from_location', to: 'player#buy_from_location'
  get 'sell_from_location', to: 'player#sell_from_location'

  get 'account_settings', to: 'player#account_settings'

  get 'player/move_left'
  get 'player/move_up'
  get 'player/move_right'
  get 'player/move_down'

  
  resources :player
  get 'buy_upgrade/:upgrade_id', to: 'player#buy_upgrade', as: 'buy_upgrade'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
