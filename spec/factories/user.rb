FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Lorem.characters(number:10) }
    encrypted_password { Faker::Lorem.characters(number:10) }
  end
end