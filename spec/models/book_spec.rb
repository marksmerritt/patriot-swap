require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:book) }.to change{ Book.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:isbn) }
  end
end
