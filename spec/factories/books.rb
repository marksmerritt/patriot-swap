FactoryBot.define do
  factory :book do
    title { "The Pragmatic Programmer: From Journeyman to Master" }
    isbn { "9780201616224" }
  end

  factory :second_book, class: Book do
    title { "The Second Book" }
    isbn { "9780201611234" }
  end

  factory :fixture_book, class: Book do
    title { "Effective Java" }
    isbn { "9780134685991" }
  end
end
