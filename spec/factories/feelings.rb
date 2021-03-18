FactoryBot.define do
  factory :feeling do
    feel_id    { Faker::Number.within(range: 2..13) }
    feeling_to { Faker::Name.name }
    association :character
  end
end
