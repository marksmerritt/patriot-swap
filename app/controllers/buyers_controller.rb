class BuyersController < ApplicationController
  def index
    query = params[:q].presence || "*"
    @listings = Listing.search(query,
                               where: { status: :active },
                               page: params[:page], per_page: 10,
                               includes: [:tags, 
                                          :book, 
                                          images_attachments: [:blob]]
                               )
    if params[:q]
      @ebay_books = EbayFinder.by_isbn(isbn: params[:q], limit: 3)
    end
  end
end

