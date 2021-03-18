FactoryBot.define do
  factory :character_info do
    character_name { Faker::Lorem.word }
    pc_number { Faker::Number.number(digits: 1) }
    secret_n { Faker::Number.number(digits: 1) }
    secret { Faker::Lorem.sentence }
    last_resort_n { Faker::Number.number(digits: 1) }
    last_resort { Faker::Lorem.sentence }
  end
end
