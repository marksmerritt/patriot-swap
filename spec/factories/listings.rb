FactoryBot.define do
  factory :listing do
    title { "My Awesome Textbook" }
    body { "I'm selling my awesome textbook" }
    association :seller, factory: :user
    association :book
    price_cents { 1000 }
  end

  factory :second_listing, class: Listing do
    title { "My Awesome 2nd Textbook" }
    body { "I'm selling my awesome 2nd textbook" }
    association :seller, factory: :user
    association :book
    price_cents { 2000 }
  end
end
