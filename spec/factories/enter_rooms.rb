FactoryBot.define do
  factory :enter_room do
    role     { Faker::Number.within(range: 1..8) }
    token    { Faker::Internet.uuid }
    password { Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 1, min_numeric: 1) }
  end
end
