require "rails_helper"

describe "navigation" do 
  describe "#index" do
    context "when a user is logged in" do 
      let(:user) { FactoryBot.create(:user) }
      let(:isbn) { FactoryBot.build_stubbed(:fixture_book).isbn }

      before do 
        login_as(user, scope: :user)
        visit sellers_path
        fill_in "book-search-field", with: isbn
        click_button "book-search-submit"
      end

      it "is reachable from the homepage" do 
        visit root_path
        click_link "nav-sell-btn"
        expect(current_path).to eq(sellers_path)
      end

      it "allows for search" do 
        expect(page).to have_content("Effective Java")
      end

      it "redirects to new listing page" do 
        click_link "sell-book-#{isbn}"
        expect(current_path).to eq(new_book_listing_path(Book.first.friendly_id))
      end
    end
  end
end