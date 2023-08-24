Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy', as: :sign_out
  end
 

  get 'splash', to: 'static_pages#splash'
  
  authenticated :user do
    root 'sections#index', as: :authenticated_root
  end

  unauthenticated do
    root 'static_pages#splash', as: :unauthenticated_root
  end

  resources :users do
    resources :sections do
      resources :payments
    end
  end
end
