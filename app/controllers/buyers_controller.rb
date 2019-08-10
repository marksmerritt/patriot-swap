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

  end
end

