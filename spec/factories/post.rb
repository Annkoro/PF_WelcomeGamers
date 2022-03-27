FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 20) }
    caption { Faker::Lorem.characters(number: 100) }
    user
  end
end