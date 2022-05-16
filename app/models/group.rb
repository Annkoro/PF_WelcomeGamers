class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 50 }
  has_one_attached :image
end
