FactoryBot.define do
  factory :notification do
    association :recipient, factory: :user
    association :actor, factory: :user
    read_at { nil }
    action { "message" }
    association :notifiable, factory: :listing
  end
end
