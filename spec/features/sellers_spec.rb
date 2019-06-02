require "rails_helper"

describe "navigation" do 
  describe "index" do 
    context "when a user is signed in" do 
      before do
        @user = FactoryBot.create(:user)
        login_as(@user, :scope => :user)
        @book1 = FactoryBot.create(:book) 
        @book2 = FactoryBot.create(:second_book)
      end

      it "allows a user to choose a book to list for sale" do 
        visit sellers_path
        click_link "sell-book-#{@book1.id}"
        
        expect(current_path).to eq(new_book_listing_path(@book1))
      end
    end

    context "when a user is not signed in" do 
      it "redirects to sign in" do 
        visit sellers_path
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end