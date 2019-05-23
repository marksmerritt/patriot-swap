require "rails_helper"

describe "navigation" do 
  describe "index" do 
    it "displays a list of courses" do 
      @course1 = FactoryBot.create(:course)
      @course2 = FactoryBot.create(:second_course)

      visit courses_path
      expect(page).to have_content(/#{@course1.code}|#{@course1.title}|#{@course2.code}|#{@course2.title}/)
    end
  end

  describe "new" do 
    context "with valid input" do 
      it "can be created from a form" do 
        visit new_course_path
        fill_in "code-field", with: "IT300"
        fill_in "title-field", with: "Modern Telecommunications"

        expect{ click_button "course-submit-btn" }.to change{ Course.count }.by(1)
      end
    end

    context "with invalid input" do 
      it "is not created from the form" do 
        visit new_course_path
        fill_in "code-field", with: "something"
        fill_in "title-field", with: "1"
        click_button "course-submit-btn"

        expect{ click_button "course-submit-btn" }.to change{ Course.count }.by(0)
      end
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