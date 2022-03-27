class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーションの設定
  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :caption, presence: true, length: { minimum: 10, maximum: 400 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
