# require 'rails_helper'

# RSpec.describe Public::SessionsController, type: :controller do
#   before do
#     # ユーザを作成する (buildでなくcreate)
#     @user = FactoryBot.create(:user)

#     # 各 it ... do ... end の前に、SessionsController#createにPOSTでリクエストを発行
#     # login_path じゃなくて コントローラのメソッドを記載 (:create)
#     post :create, params: {
#       session: {
#         id: @user.id,
#         email: @user.email,
#         password: @user.password
#       }
#     }
#   end

#   # @request.env["devise.mapping"] = Devise.mappings[:customer_user]


#   describe 'sessions#create' do
#     context "ログインが成功した場合" do
#       it 'ユーザー名が同じであること' do
#         # ここは実際は意味がないかも
#         expect(@user.name).to eq 'testuser'
#       end

#       it 'passwordが同じであること' do
#         # ここも実際は意味がないかも
#         expect(@user.password).to eq 'password'
#       end

#       it 'マイページにリダイレクトされること' do
#         # ここでもう一回 post :create... をするのはムダなので、before ... でアクセス
#         # エラーになったのは、ここの params がどこから渡ってきた変数なのかわからないため
#         # また、post :create... の結果は、response オブジェクトで取得できるので、そちらで確認
#         # expect(post :create, params: params).to redirect_to(mypage_path)

#         expect(response).to redirect_to(user_path)
#       end
#     end
#   end
# end