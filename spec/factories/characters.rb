FactoryBot.define do
  factory :character do
    character_name { Faker::Lorem.word }
    pc_number      { Faker::Number.number(digits: 1) }
    association :room
  end
end
