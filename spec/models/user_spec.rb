# frozen_string_literal: true

require 'rails_helper'

describe "モデルのテスト" do
  it "新規登録ができる" do
    user = FactoryBot.build(:user)
    expect(FactoryBot.build(:user)).to be_valid
  end
end