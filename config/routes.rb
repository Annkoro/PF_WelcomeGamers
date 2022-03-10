Rails.application.routes.draw do

  #ログイン前トップ画面
  root to: "homes#top"

  #顧客用（登録とログインのみ）
  #URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  get 'public/top' => 'public/users#top'

  #管理者用（ログインのみ）
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  #ユーザー側のURLにはpublicはつかない
  scope module: :public do
    resources :posts
  end


  #管理者側のURLにadminをつける
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
