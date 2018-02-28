Rails.application.routes.draw do
    root 'home#inicio'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registros: 'users/registros'
  }
  resources :users, only: [] do
    resources :chats
  end
end
