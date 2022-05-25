Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :menu, only: :index
    namespace :api do
      resources :menu do
        collection do
          get :by_status
        end
      end
    end
  end
  namespace :admin do
    resources :positions, only: :index do
      member do
        post :move_to_next_status
      end
    end
  end
end
