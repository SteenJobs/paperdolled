Rails.application.routes.draw do
  
  devise_scope :user do
    get "/" => "registrations#new"
    get 'users/sign_in', to: redirect('/')
    get 'users/sign_up', to: redirect('/')
    put '/update' => "registrations#update", as: "user_update"
    get 'users/edit' => "registrations#edit", as: "devise_user_edit"
    get 'users/:id' => "users#show", as: "user_show"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations" }

  resources :users do 
    resources :outfits
    resources :closets, only: [:create]
  end

  resources :scenarios
  resources :answers
  resources :items
  
  get '/about' => 'welcome#about', as: "about"
  root 'welcome#index'

end
