require "rails_helper"

describe "navigation" do 
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