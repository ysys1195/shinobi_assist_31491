FactoryBot.define do
  factory :role do
    association :user
    association :room
  end
end
