Rails.application.routes.draw do

  post 'battles/get_finished'

  get 'battles/lose'

  get 'battles/finished'

  post 'battles/skill_update/:id' => 'battles#skill_update', as: 'battles_skill_update'

  get 'battles/show/:my_id/:opponent_id' => 'battles#show', as: 'battles_show'

  resources :skill_data

<<<<<<< HEAD
  get 'users/monster_show/:id' => 'users#monster_show', as: 'users_monster_show'
=======
  get 'users/request_approval/:monster_id/:user_id' => 'users#request_approval', as: 'users_request_approval'

  delete 'users/request_rejection/:monster_id/:user_id' => 'users#request_rejection', as: 'users_request_rejection'

  post 'users/exchange/:id' => 'users#exchange', as: 'users_exchange'
>>>>>>> 7dc2a63a1595bd43b453c1cac8de534c0312d530

  post 'users/monster_having/:id' => 'users#monster_having', as: 'users_monster_having'

  post 'users/monster_first/:id' => 'users#monster_first', as: 'users_monster_first'

  post 'users/monster_have/:id' => 'users#monster_have', as: 'users_monster_have'

  delete 'users/monster_destroy/:id' => 'users#monster_destroy', as: 'users_monster_destroy'

  get 'users/loginform'

  post 'users/login'

  post 'users/logout'

  get 'users/mypage'

  get 'users/practice'

  get 'users/boss'

  get 'users/communication'

  get 'users/settings'

  get '/' => 'homes#top'

  post 'monster_detail/synchronize'

  post 'monster_detail/recovery'

  resources :users do
    member do
      resources :monster_detail
    end
  end
  resources :monster_data
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
