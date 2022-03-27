FactoryBot.define do
  factory :contact do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Lorem.characters(number: 15) }
    subject { Faker::Lorem.characters(number: 10) }

    message { Faker::Lorem.characters(number: 40) }
    user
  end
end
