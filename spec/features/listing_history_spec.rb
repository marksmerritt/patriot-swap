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
  end
end