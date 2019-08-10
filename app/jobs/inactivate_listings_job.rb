class InactivateListingsJob < ApplicationJob
  queue_as :default

  def perform
    Listing.expired.each do |listing|
      listing.inactive!
      ListingInactivationMailer.email(listing.seller).deliver_later
    end
  end
end
