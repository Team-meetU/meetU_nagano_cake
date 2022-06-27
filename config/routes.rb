Rails.application.routes.draw do
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do

  root to: "homes#top"
  resources :cart_items, only: [:index, :update, :destroy, :create]do
  collection do
      delete :destroy_all
    end
  end
  resources :addresses, except: [:new]
  resources :items, only: [:show, :index]
  resources :customers, only: [:edit, :update]
  resources :orders, only: [:new, :create, :show, :index] do
    collection do
      post :confirm
      get :thanks
    end
  end
  get "customers/my_page" => "customers#show"
  get "about" => "homes#about"

end

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, except:[:destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:show, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end