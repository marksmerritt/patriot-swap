class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.seller = current_user


    if @listing.save
      redirect_to @listing, success: "Listing created successfully"
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :body, :price_cents)
  end
end
