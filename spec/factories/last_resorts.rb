FactoryBot.define do
  factory :last_resort do
    last_resort_n { Faker::Number.number(digits: 1) }
    last_resort   { Faker::Lorem.sentence }
    association :character
  end
end
