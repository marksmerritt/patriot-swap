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

    get_ebay_listings if params[:q]
  end

  private

  def get_ebay_listings
    if IsbnChecker.is_possible_isbn(params[:q])
      @ebay_books = EbayFinder.by_isbn(isbn: params[:q], limit: 3)
    end
  end
end

