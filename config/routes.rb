Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'home#index'

  get 'home/index'
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/dash_boards', to: 'users#dash_boards'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
