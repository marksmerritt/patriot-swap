require "rails_helper"

describe "navigation" do
  describe "index" do 
    it "displays listings" do 
      @listing1 = FactoryBot.create(:listing)
      @listing2 = FactoryBot.create(:second_listing)

      visit listings_path
      expect(page).to have_content(/#{@listing1.title}|#{@listing2.title}/)
    end
  end

  describe "new" do 
    before do 
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
    end

    context "with valid input" do 
      it "can be created from a form" do 
        visit new_listing_path
        fill_in "title-field", with: "Some Great Title"
        fill_in "price-cents-field", with: "10000"

        expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(1)
      end
    end

    context "with invalid input" do 
      it "is not created from the form" do 
        visit new_listing_path
        fill_in "title-field", with: "So"
        fill_in "price-cents-field", with: "10000000"

        expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(0)
      end
    end
  end

  describe "show" do 
    let(:listing) { FactoryBot.create(:listing) }

    it "displays the correct attributes" do 
      visit listing_path(listing)
      expect(page).to have_content(listing.title)
    end
  end
end