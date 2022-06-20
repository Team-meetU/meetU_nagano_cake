Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end

devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  #devise_for :admins

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
