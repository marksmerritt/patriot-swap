require "rails_helper"

describe "navigation" do 
  describe "index" do 
    it "allows a user to select a book to buy" do 
      @book1 = FactoryBot.create(:book)
      @book2 = FactoryBot.create(:second_book)

      visit buyers_path
      click_link "buy-book-#{@book1.id}"
      expect(current_path).to eq(book_path(@book1))
    end
  end
end