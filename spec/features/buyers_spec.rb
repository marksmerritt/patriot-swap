require "rails_helper"

describe "navigation" do 
  describe "index" do 
    before do 
      @listing1 = FactoryBot.create(:listing)
      @listing2 = FactoryBot.create(:second_listing)
      visit buyers_path
    end

    it "displays links to listings" do 
      click_link "listing-#{@listing1.id}-show"
      expect(current_path).to eq(book_listing_path(@listing1.book.friendly_id, @listing1.id))
    end
  end
end