Rails.application.routes.draw do
    root 'home#inicio'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registros: 'users/registros'
  }
end
