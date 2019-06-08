class BuyersController < ApplicationController
  def index
    @listings = Listing.includes(:book)
  end
end

