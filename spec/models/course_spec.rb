require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:course) }.to change{ Course.count }.by(1)
    end
  end

  describe "validation" do 
    let(:course) { FactoryBot.build_stubbed(:course) }

    it "has a code" do 
      course.code = nil
      expect(course).to_not be_valid
    end

    it "has a code in the correct format" do 
      course.code = "IT30a"
      expect(course).to_not be_valid
    end

    it "has a title" do 
      course.title = nil 
      expect(course).to_not be_valid
    end
  end
end
