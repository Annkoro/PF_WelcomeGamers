FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Lorem.characters(number:10) }
    password { Faker::Lorem.characters(number:10) }
  end
end