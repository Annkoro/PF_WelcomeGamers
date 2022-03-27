# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :modil do

  describe "Userモデルのテスト" do
    it "新規登録ができる" do
      user = FactoryBot.build(:user)
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  context "emailカラム" do
    it "空欄でないこと" do
      user = FactoryBot.build(:user)
      user.email = ""
      expect(FactoryBot.build(:user)).to eq
    end

    it "一意性があること" do
      user = FactoryBot.build(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to be_invalid
      # expect(FactoryBot.build(:user)).to eq false
    end

    it "６文字以上であること" do
    user = FactoryBot.build(:user)
      user.email = Faker::Lorem.characters(number: 6)
      expect(FactoryBot.build(:user)).to eq
    end

    it "３０文字以下であること" do
      user = FactoryBot.build(:user)
      user.email = FactoryBot::Lorem.characters(number: 30)
      expect(FactoryBot.build(:user)).to eq
    end
  end
end