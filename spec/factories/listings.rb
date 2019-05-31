FactoryBot.define do
  factory :listing do
    title { "My Awesome Textbook" }
    association :seller, factory: :user
    association :book
    price_cents { 1000 }
  end

  factory :second_listing, class: Listing do
    title { "My Awesome 2nd Textbook" }
    association :seller, factory: :user
    association :book
    price_cents { 2000 }
  end
end
