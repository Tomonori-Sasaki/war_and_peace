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

  resources :users do
    member do
      resources :monster_detail
    end
  end
  resources :monster_data
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
