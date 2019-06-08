class BuyersController < ApplicationController
  def index
    # TODO: N+1
    query = params[:q].presence || "*"
    @listings = Listing.search(query)
  end
end

