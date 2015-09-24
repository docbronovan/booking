Rails.application.routes.draw do

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

  resources :slots, only: [] do
      resources :slot_applications
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
