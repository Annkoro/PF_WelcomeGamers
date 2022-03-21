class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {minimum: 1, maximum: 20}
  validates :gameid, length: {maximum: 50}
  validates :voicechat, length: {maximum: 50}
  validates :playstyle, length: {maximum: 50}
  validates :playtime, length: {maximum: 50}
  validates :caption, length: {maximum: 400}

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #自分がフォローしているユーザーとの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower

  # #自分をフォローしているユーザーとの関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  has_one_attached :profile_image


  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
