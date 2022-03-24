class Contact < ApplicationRecord

  validates :name, length: {minimum: 2, maximum: 20}
  validates :email, length: {minimum: 2, maximum:30}
  validates :subject, length: {minimum: 2, maximum: 30}
  validates :message, length: {minimum: 2, maximum: 400}

end
