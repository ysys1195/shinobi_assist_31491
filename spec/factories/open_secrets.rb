FactoryBot.define do
  factory :open_secret do
    secret_unveil_to { Faker::Number.number(digits: 1) }
    unveiled_id      { Faker::Number.within(range: 1..2) }
    association :secret
  end
end
