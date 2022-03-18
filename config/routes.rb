Rails.application.routes.draw do

  #ログイン前トップ画面
  root to: "homes#top"

  #顧客用（登録とログインのみ）
  #URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #管理者用（ログインのみ）
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー側のURLにはpublicはつかない
  scope module: :public do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, except: [:new, :create, :destroy] do
      resource :relationships, only: [:create, :destroy]
      member do
        get 'top'
        get 'followings'
        get 'followers'
      end
    end
    resources :contacts, only: [:new, :create]
      post 'confirm'
      post 'back'
      get 'done'
  end


  #管理者側のURLにadminをつける
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
