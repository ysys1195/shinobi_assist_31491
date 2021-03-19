FactoryBot.define do
  factory :session_log do
    title { Faker::Lorem.word }
    log   { Faker::Lorem.sentences }
    association :user
    association :room
  end
end
