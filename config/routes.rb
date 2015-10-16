Rails.application.routes.draw do

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  devise_for :users
  
  get 'welcome/index'
  root to: 'welcome#index'
  get 'bands/:id/about' => 'bands#about'
  get 'venues/:id/about' => 'venues#about'

  resources :users, only: [:update, :show, :index] do
    resources :bands 
  end 

  resources :events do
    resources :slots, except: [:index], controller: 'events/slots' 
  end

  get "/slots/:id//edit.:band_id" => "slots#edit"

  resources :slots, only: [:update,:destroy] do
      resources :slot_applications
      resources :bands
    end

  resources :venues do
    resources :events, only: [:new , :index, :show, :create, :destroy], controller: 'venues/events'
  end
  resources :bands 
  
  resources :slots do
    resources :slot_applications
  end
  resources :slot_applications
  
  

end
