Rails.application.routes.draw do
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
  resources :cart_items
  resources :addresses
  resources :items
  resources :customers, only:[:edit, :update]
  get "costomers/my_page" => "customers#show"


  root  "homes#top"
get "about" => "homes#about"
get "oders/thanks"
end

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, except:[:destroy]
    resources :order, only: [:show, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end