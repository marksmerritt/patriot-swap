require "rails_helper"

describe "navigation" do 
  describe "index" do 
    before do 
      visit root_path
    end

    it "has a search form for listings" do 
      fill_in "listing-search-field", with: "IT100"
      click_button "listing-search-submit"
      expect(current_path).to eq(buyers_path)
    end

    it "has a link to browse listings" do 
      click_link "browse-listings-link"
      expect(current_path).to eq(buyers_path)
    end
  end
end