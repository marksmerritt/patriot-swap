module BookSearch
  # TODO: Move to forked gem
  def self.by_isbn(isbn)
    books = GoogleBooks.search("isbn:#{isbn}", api_key: ENV["GOOGLE_KEY"])
    books.first
  end
end