FactoryBot.define do
  factory :listing do
    title { "My Awesome Textbook" }
    condition { "good" }
    association :seller, factory: :user
    association :book
    price_cents { 1000 }
  end

  factory :second_listing, class: Listing do
    title { "Some Title" }
    condition { "poor" }
    association :seller, factory: :user
    association :book, factory: :second_book
    price_cents { 2000 }
  end

  factory :inactive_listing, class: Listing do
    title { "Some Inactive Title" }
    condition { "brand_new" }
    association :seller, factory: :user
    association :book, factory: :second_book
    price_cents { 2000 }
    status { "inactive" }
  end
end
