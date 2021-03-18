FactoryBot.define do
  factory :secret do
    secret_n { Faker::Number.number(digits: 1) }
    secret   { Faker::Lorem.sentence }
    association :character
  end
end
