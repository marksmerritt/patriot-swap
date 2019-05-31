require "rails_helper"

describe "navigation" do 
  describe "index" do 
    before do 
      @book1 = FactoryBot.create(:book)
      @book2 = FactoryBot.create(:second_book)
    end

    it "displays a list of books" do 
      visit books_path
      expect(page).to have_content(@book1.title).and have_content(@book2.title)
    end
  end

  describe "show" do 
    before do 
      @book = FactoryBot.create(:book)
    end

    it "can be reached from the index page" do 
      visit books_path
      click_link "book-#{@book.id}-show"

      expect(current_path).to eq(book_path(@book))
    end
  end

  describe "new" do 
    context "with valid input" do 
      it "can be created through a form" do 
        visit new_book_path
        fill_in "title-field", with: "Some Title"
        fill_in "isbn-field", with: "Some ISBN"
        fill_in "tag-names-field", with: "IT400"

        expect{ click_button "submit-btn" }.to change{ Book.count }.by(1)
      end
    end

    context "with invalid input" do 
      it "cannot be created through the form" do 
        visit new_book_path

        expect{ click_button "submit-btn" }.to change{ Book.count }.by(0)
      end
    end
  end
end