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

  describe "new" do 
    it "can be created through a form" do 
      visit new_book_path
      fill_in "title-field", with: "Some Title"
      fill_in "isbn-field", with: "Some ISBN"
      fill_in "tag-names-field", with: "IT400"

      expect{ click_button "submit-btn" }.to change{ Book.count }.by(1)
    end
  end
end