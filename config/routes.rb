Rails.application.routes.draw do
  # ログイン前トップ画面
  root to: "homes#top"

  # ゲストログイン
  devise_scope :user do
    post 'guests/guest_sign_in', to: 'guests/sessions#guest_sign_in'
  end

  # 顧客用（登録とログインのみ）
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  # 管理者用（ログインのみ）
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  # ユーザー側のURLにはpublicはつかない
  scope module: :public do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, except: [:new, :create, :destroy] do
      resource :relationships, only: [:create, :destroy]
      member do
        get 'followings'
        get 'followers'
      end
      collection do
        get 'search'
      end
    end
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'thanks'
      end
    end
  end

  # 管理者側のURLにadminをつける
  namespace :admin do
    resources :users, only: [:index, :show, :destroy] do
      member do
          get 'followings'
          get 'followers'
      end
    end
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :contacts, only: [:index, :show]
  end
end
