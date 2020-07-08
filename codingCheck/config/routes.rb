Rails.application.routes.draw do
  root to: 'jobs#index'
  
  get  'signup', to: 'users#signup'
  post 'users/create'
  
  # ログイン / ログアウト
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'
  
  get  'corp_admin/signup', to: 'corporation_admins#signup'
  get  'corp_admin/index', to: 'corporation_admins#job_list'
  get  'corp_admin/user_list/:job_id' => 'corporation_admins#user_list'
  post 'corporation_admins/create'
  
  # 企業ログイン / ログアウト
  get     'corp_admin/login',   to: 'sessions#corporation_new'
  post    'corp_admin/login',   to: 'sessions#corporation_login'
  delete  'corp_admin/logout',  to: 'sessions#corporation_logout'
  
  get 'index' => 'jobs#index'
  get 'jobs/index'
  
  post   'jobs/:job_id/like' => 'job_likes#create'
  # delete 'jobs/:job_id/like' => 'job_likes#destroy'
  
  post   'users/:job_id/:user_id/like' => 'user_likes#create'
  
  resources :users

end
