Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registros'
  }
      root 'home#inicio'

  resources :users, only: [] do
    resources :chats
  end
end
