# frozen_string_literal: true

require 'rails_helper'

describe "Postモデルのテスト" do
  it "有効な投稿内容の場合は保存されるか" do
    user = FactoryBot.build(:user)
    expect(FactoryBot.build(:post, user: user)).to be_valid
  end
end