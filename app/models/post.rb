class Post < ApplicationRecord

  belongs_to :user

  #バリデーションの設定
  validates :title, presence: true
  validates :caption, presence: true

end
