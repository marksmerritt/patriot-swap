class BookSearch
  class << self
    Book::SEARCHABLE_ATTRS.each do |attr|
      define_method "by_#{attr}" do |value|
        books = GoogleBooks.search("#{attr}:#{value}", api_key: ENV["GOOGLE_KEY"])
        books.first
      end
    end
  end
end