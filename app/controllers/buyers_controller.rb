class BuyersController < ApplicationController
  def index
    query = params[:q].presence || "*"
    @listings = Listing.search(query, where: { status: :active }, 
                                      includes: [:tags, 
                                                 :book, 
                                                 images_attachments: [:blob]], 
                                      page: params[:page], per_page: 20)
  end
end

