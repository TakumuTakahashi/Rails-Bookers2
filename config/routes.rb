Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as: 'home_about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, except: [:new]
end
