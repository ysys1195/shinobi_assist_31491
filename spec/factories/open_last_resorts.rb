FactoryBot.define do
  factory :open_last_resort do
    lr_unveil_to { Faker::Number.number(digits: 1) }
    unveiled_id  { Faker::Number.within(range: 1..2) }
    association :last_resort
  end
end
