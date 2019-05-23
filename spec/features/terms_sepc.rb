require "rails_helper"

describe "navigation" do 
  describe "new" do 
    it "can be created from a form" do 
      visit new_term_path
      select "spring", from: "term[season]"
      fill_in "year-field", with: "2020"

      expect{ click_button "term-submit-btn" }.to change{ Term.count }.by(1)
    end
  end
end