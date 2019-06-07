class BookSearch
  class << self
    VALID_PARAMS = Book::SEARCHABLE_ATTRS

    VALID_PARAMS.each do |attr|
      define_method "by_#{attr}" do |value|
        books = GoogleBooks.search("#{attr}:#{value}", api_key: ENV["GOOGLE_KEY"])
        books.first
      end
    end
  end
end