class BuyersController < ApplicationController
  def index
    query = params[:q].presence || "*"
    @listings = Listing.search(query)
  end
end

