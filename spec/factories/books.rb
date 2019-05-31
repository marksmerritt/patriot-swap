FactoryBot.define do
  factory :book do
    title { "The Pragmatic Programmer: From Journeyman to Master" }
    isbn { "978-0201616224" }
    tags_as_string { "IT700" }
  end

  factory :second_book, class: Book do
    title { "The Second Book" }
    isbn { "978-0201611234" }
    tags_as_string { "IT800" }
  end
end
