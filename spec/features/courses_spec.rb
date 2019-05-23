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

  describe "show" do 
    let(:course) { FactoryBot.create(:course) }

    it "displays the correct attributes" do 
      visit course_path(course)
      expect(page).to have_content(course.code).and have_content(course.title)
    end
  end
end