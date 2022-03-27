# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Userモデルに関するテスト", type: :modil do

  describe "基本機能のテスト" do
    it "新規登録ができる" do
      # user = FactoryBot.build(:user)
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  describe "アソシエーションのテスト" do
    context "Postモデルとの関係" do
      it "1:Nになっている" do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context "Commentモデルとの関係" do
      it "1:Nになっている" do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context "Favoriteモデルとの関係" do
      it "1:Nになっている" do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context "Contactモデルとの関係" do
      it "1:Nになっている" do
        expect(User.reflect_on_association(:contacts).macro).to eq :has_many
      end
    end
    # context "Relationshipモデルとの関係" do
    #   it
  end

  describe "バリデーションのテスト" do
    context "emailカラム" do
      before do
        @user = FactoryBot.build(:user)
      end
      it "同じemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email は既に使用されています。")
      end

  #     it "６文字以上であること" do
  #       user.email = Faker::Lorem.characters(number: 6)
  #       is_expected.to eq true
  #     end
  #     it "３０文字以下であること" do
  #       user.email = FactoryBot::Lorem.characters(number: 30)
  #       expect(FactoryBot.build(:user)).to eq
  #     end
        #     it "空欄でないこと" do
#       user.email = ""
#       expect(FactoryBot.build(:user)).to eq
#     end
    end
  end
end