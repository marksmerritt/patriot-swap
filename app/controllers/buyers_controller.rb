class BuyersController < ApplicationController
  def index
    @books = Book.all
    @book_search = BookSearch.by_isbn("9781423901327")
  end
end

