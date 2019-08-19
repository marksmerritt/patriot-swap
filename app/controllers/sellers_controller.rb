class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:q]
      @book = BookCreator.call(params[:q]).book

      unless @book 
        @ebay_books = EbayFinder.by_isbn(isbn: params[:q], limit: 1)
      end
    end
  end
end

