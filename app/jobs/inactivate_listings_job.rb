class InactivateListingsJob < ApplicationJob
  queue_as :default

  def perform
    Listing.expired.each do |listing|
      listing.inactive!
    end
  end
end
