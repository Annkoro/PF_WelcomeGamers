class Post < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  #バリデーションの設定
  validates :title, presence: true
  validates :caption, presence: true

end
