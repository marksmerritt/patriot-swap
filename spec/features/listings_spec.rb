require "rails_helper"

describe "navigation" do 
  describe "new" do 
    before do 
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
    end

    it "can be created from a form" do 
      visit new_listing_path
      fill_in "title-field", with: "Some Great Title"
      fill_in "body-field", with: "I am selling my great titled book"
      fill_in "price-cents-field", with: "10000"

      expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(1)
    end
  end
end