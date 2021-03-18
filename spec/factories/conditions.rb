FactoryBot.define do
  factory :condition do
    state_id { Faker::Number.within(range: 2..13) }
    association :character
  end
end
