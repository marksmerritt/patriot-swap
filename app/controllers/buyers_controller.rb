class BuyersController < ApplicationController
  def index
    query = params[:q].presence || "*"
    @listings = Listing.search(query, includes: [:tags, seller: :avatar_attachment])
  end
end

