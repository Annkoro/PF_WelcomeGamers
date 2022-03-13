class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  #バリデーションの設定
  validates :title, presence: true
  validates :caption, presence: true

end
