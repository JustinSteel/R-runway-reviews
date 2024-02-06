FactoryBot.define do
  factory :review do
    user_id { Faker::Number.between(from: 1, to: 5) }
    airport_id { Faker::Number.between(from: 1, to: 30) }
    comment { Faker::Hipster.sentence }
    category { Faker::Number.between(from: 0, to: 5) }
  end
end