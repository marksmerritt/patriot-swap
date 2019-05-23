FactoryBot.define do
  factory :listing do
    title { "My Awesome Textbook" }
    body { "I'm selling my awesome textbook" }
    association :seller, factory: :user
    price_cents { 1000 }
  end
end
