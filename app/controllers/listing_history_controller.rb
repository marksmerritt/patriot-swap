class ListingHistoryController < ApplicationController
  def index
    @listings = current_user.listings
  end
end
