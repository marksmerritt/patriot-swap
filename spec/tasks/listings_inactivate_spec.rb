require "rails_helper"
require "rake"
PatriotSwap::Application.load_tasks

describe "listings:inactivate" do 
  it "inactivates expired listings" do  
    @expired_listing = FactoryBot.create(:second_listing, updated_at: 30.days.ago) 

    Rake::Task["listings:inactivate"].invoke

    expect(@expired_listing.reload.status).to eq("inactive")
  end

  it "does not inactivates listings that are not expired" do  
    @active_listing = FactoryBot.create(:listing) 

    Rake::Task["listings:inactivate"].invoke

    expect(@active_listing.reload.status).to eq("active")
  end
end