FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    birthdate { Faker::Date.birthday(18, 65) }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
