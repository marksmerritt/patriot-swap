class BookSearch
  def self.by_isbn(isbn)
    isbn = isbn.gsub("-", "")
    GoogleBooks.search("isbn:#{isbn}", api_key: ENV["GOOGLE_KEY"])
  end
end