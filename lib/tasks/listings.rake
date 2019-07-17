# TODO: Move to BG Job
namespace :listings do
  desc "Inactivates expired listings"
  task inactivate: :environment do
    Listing.expired.each do |listing|
      listing.inactive!
    end
  end
end
