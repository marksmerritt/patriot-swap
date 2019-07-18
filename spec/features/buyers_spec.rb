require "rails_helper"

describe "navigation" do 
  describe "index" do 
    before do 
      @listing1 = FactoryBot.create(:listing)
      @listing2 = FactoryBot.create(:second_listing)
      @inactive_listing = FactoryBot.create(:inactive_listing)
      Listing.reindex
      Listing.searchkick_index.refresh
      visit buyers_path
    end

    it "displays links to listings" do 
      click_link "listing-#{@listing1.id}-show"
      expect(current_path).to eq(listing_path(@listing1.id))
    end

    it "allows search" do 
      fill_in "listing-search-field", with: @listing1.title
      click_button "listing-search-submit", visible: false

      expect(page).to have_content(@listing1.book.title).and have_no_content(@listing2.title)
    end

    it "only displays active listings" do 
      expect(page).to_not have_content(@inactive_listing.title)
    end
  end
end