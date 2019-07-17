namespace :listings do
  desc "Inactivates expired listings"
  task inactivate: :environment do
    InactivateListingsJob.perform_later
  end
end
