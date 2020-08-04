Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup' , to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    
    #memberとcollectionの違い
    #検索結果を表示する場合は、ユーザを特定しては意味がないからcollectionを使用する
    #collectionは:idが含まれないURLを生成する
  end  
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
