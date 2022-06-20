Rails.application.routes.draw do

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
