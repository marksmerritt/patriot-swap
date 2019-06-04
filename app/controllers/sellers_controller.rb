class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # TODO: This does not belong here. Refactor and move to service
    query = params[:q]
    if query.present?
      @book_search = BookSearch.by_isbn(params[:q])
      if @book_search.isbn
        @book = Book.where(isbn: @book_search.isbn).first_or_create do |book|
          book.title = @book_search.title
          book.isbn = @book_search.isbn
        end
      end
    end
  end
end

