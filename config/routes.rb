Rails.application.routes.draw do
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
  resources :cart_items
  resources :addresses
  resources :items
  resources :customers
  root  "homes#top"
  get  "homes/about"
end
end