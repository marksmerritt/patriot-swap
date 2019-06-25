class ConversationsController < ApplicationController
  before_action :set_listing

  def create 
    @conversation = Conversation.for_listing(@listing.id).between(@listing.seller.id, current_user.id).first_or_create
    redirect_to book_listing_path(@listing.book, @listing)
  end


  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
