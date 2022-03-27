# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  # describe "バリデーションのテスト" do
  #   subject { post.valid? }

  #   let(:user) { create(:use) }
  #   let!(post) { build(:post, user: user) }

  #   context "titleカラム" do
  #     it "空欄でない" do
  #       post.title = ""
  #     end
  #   end
  # end
  describe "Postモデルのテスト" do
    it "有効な投稿内容の場合は保存されるか" do
      user = FactoryBot.build(:user)
      expect(FactoryBot.build(:post, user: user)).to be_valid
    end
  end

  describe "アソシエーションのテスト" do
    context "Userモデルとの関係" do
      it "N:1になっている" do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Commentモデルとの関係" do
      it "1:Nになっている" do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context "Favoriteモデルとの関係" do
      it "1:Nになっている" do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
