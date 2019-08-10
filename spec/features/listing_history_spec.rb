require "rails_helper"

describe "listing history" do 
  before do 
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    visit root_path
  end


  describe "index" do 
    it "is reachable from the navbar" do 
      click_link "listing-history-link"
      expect(current_path).to eq(listing_history_index_path)
    end
  end
end