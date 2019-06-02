# TODO: Google Cloud is down...
module BookSearch
  def self.by_isbn(isbn)
    books = GoogleBooks.search("isbn:#{isbn}", api_key: ENV["google_key"])
  end
end