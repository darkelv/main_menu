Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :positions, only: :index do
      member do
        post :move_to_next_status
      end
    end
  end
end
