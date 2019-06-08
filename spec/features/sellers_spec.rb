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

      it "allows for search" do 
        expect(page).to have_content("Effective Java")
      end

      it "has a listing link that creates a book if it does not exist" do 
        expect{ click_link "sell-book-#{isbn}" }.to change{ Book.count }.by(1)
      end

      it "has a listing link that does not create a book if it exist" do 
        fixture_book = FactoryBot.create(:fixture_book)
        expect{ click_link "sell-book-#{isbn}" }.to change{ Book.count }.by(0)
      end

      it "redirects to new listing page" do 
        click_link "sell-book-#{isbn}"
        expect(current_path).to eq(new_book_listing_path(Book.first.friendly_id))
      end
    end
  end
end