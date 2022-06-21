Rails.application.routes.draw do
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
  resources :cart_items
  resources :addresses
  resources :items
  resources :customers
    
    
  root  "homes#top" 
get "about" => "homes#about"
get "oders/thanks"
end

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    resource :custromers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :show, :edit, :create, :update, :destroy]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end