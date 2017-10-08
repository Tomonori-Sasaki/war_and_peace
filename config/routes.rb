Rails.application.routes.draw do
  get 'users/loginform'

  post 'users/login'

  post 'users/logout'

  get 'users/mypage'

  get 'users/practice'

  get 'users/boss'

  get 'users/communication'

  get 'users/settings'

  get '/' => 'homes#top'

  resources :monster_data
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
