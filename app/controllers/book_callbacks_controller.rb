class BookCallbacksController < ApplicationController
  def from_google
    result = BookCreator.call(book_params)

    if result.success?
      redirect_to new_book_listing_path(result.book)
    else
      redirect_to sellers_path, error: "There was an error creating a listing for this book. Please try again."
    end
  end

  private 

  def book_params
    params.require(:isbn)
  end
end
