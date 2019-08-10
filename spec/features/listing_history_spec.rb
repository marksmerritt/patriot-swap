require "rails_helper"

describe "listing history" do 
  before do 
    @user = FactoryBot.create(:user)
    @active_listing = FactoryBot.create(:listing, seller: @user)
    @inactive_listing = FactoryBot.create(:inactive_listing, seller: @user)

    login_as(@user, :scope => :user)
    visit root_path
    click_link "listing-history-link"
  end


  describe "index" do 
    it "is reachable from the navbar" do 
      expect(current_path).to eq(listing_history_index_path)
    end

    it "displays all of the current user's listings" do 
      expect(page).to have_content(/#{@active_listing.title}|#{@inactive_listing.title}/)
    end

    it "allows a user to inactivate a listing" do 
      click_link "inactivate-listing-#{@active_listing.id}"
      expect(@active_listing.reload.status).to eq("inactive")
    end

    it "allows a user to activate a listing" do 
      click_link "activate-listing-#{@inactive_listing.id}"
      expect(@inactive_listing.reload.status).to eq("active")
    end
  end
end