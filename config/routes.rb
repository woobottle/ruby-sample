Rails.application.routes.draw do
  root 'payments#index'
  resources :cards, only: %i[] do
    collection do 
      get :success
      get :fail
    end
  end
  resources :virtual_accounts, only: %i[] do
    collection do 
      get :success
      get :fail
      post :callback
    end
  end
  resources :phones, only: %i[] do
    collection do 
      get :success
      get :fail
    end
  end
  resources :gift_cards, only: %i[] do
    collection do 
      get :success
      get :fail
    end
  end
  resources :billings, only: %i[] do
    collection do 
      get :success
      get :fail
    end
  end
end
