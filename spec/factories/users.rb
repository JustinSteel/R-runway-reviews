FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    email { Faker::Internet.unique.email }
    password { Faker::Alphanumeric.alpha(number: 15) }
  end
end
