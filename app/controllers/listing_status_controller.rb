class ListingStatusController < ApplicationController
  def update
    @listing = Listing.find(params[:id])

    if @listing.active? && @listing.inactive!
      flash[:success] = "Your listing has been inactivated."
    elsif @listing.inactive? && @listing.active!
      flash[:success] = "Your listing has been activated."
    else
      flash[:error] = "An error occured while changing the status of your listing. Please try again."
    end 
    redirect_back(fallback_location: root_path)
  end

  private

  params.require(:listing)
end
