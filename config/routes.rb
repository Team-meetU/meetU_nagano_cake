Rails.application.routes.draw do
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
  resources :cart_items
  resources :addresses
  resources :items
  resources :customers
  root  "homes#top" 
get "about" => "homes#about"
get "oders/thanks"
end


  namespace :admin do
    root to: 'homes#top'
    #resource :custromers, only: [:index, :show, :edit, :update]
  end

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end