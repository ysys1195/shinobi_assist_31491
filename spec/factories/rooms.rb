FactoryBot.define do
  factory :room do
    room_name             { Faker::Lorem.word }
    player_number         { Faker::Number.within(range: 2..8) }
    password              { Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    token                 { Faker::Internet.uuid }
    association :user
  end
end
