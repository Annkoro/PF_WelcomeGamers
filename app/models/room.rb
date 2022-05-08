class Room < ApplicationRecord
  has_many :chats
  # 一つのルームに居るユーザーは二人のため複数のhas_many
  has_many :user_rooms
end
