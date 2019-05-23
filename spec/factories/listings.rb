FactoryBot.define do
  factory :listing do
    title { "My Awesome Textbook" }
    body { "I'm selling my awesome textbook" }
    association :seller, factory: :user
  end
end
