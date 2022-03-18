class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #バリデーションの設定
  validates :title, presence: true
  validates :caption, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
