class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, presence: true, length: {minimum: 5, maximum: 50 }
  has_one_attached :image
end
