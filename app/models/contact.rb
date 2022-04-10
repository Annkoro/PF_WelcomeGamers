class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, length: { minimum: 6, maximum: 30 }
  validates :subject, presence: true, length: { minimum: 5, maximum: 30 }
  validates :message, presence: true, length: { minimum: 5, maximum: 400 }
end
