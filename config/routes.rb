Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    #resource :custromers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :show, :edit, :create, :update, :destroy]
  end

  # 管理者用
  # URL /admin/sign_in ...


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
