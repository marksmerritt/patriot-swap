require "rails_helper"

describe "navigation" do 
  describe "new" do 
    it "can be created from a form" do 
      visit new_course_path
      fill_in "code-field", with: "IT300"
      fill_in "title-field", with: "Modern Telecommunications"

      expect{ click_button "course-submit-btn" }.to change{ Course.count }.by(1)
    end
  end
end