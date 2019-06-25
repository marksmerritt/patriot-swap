FactoryBot.define do
  factory :message do
    body { "My message" }
    association :conversation
    association :user
  end
end
