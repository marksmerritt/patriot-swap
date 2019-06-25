require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:message) }.to change{ Message.count }.by(1)
    end
  end

  describe "validation" do 
    it { should belong_to(:conversation) }
    it { should belong_to(:user) }

    it { should validate_presence_of(:body) }
  end
end
