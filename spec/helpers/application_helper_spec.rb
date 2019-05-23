require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#flash_class" do
    it "returns the correct class for notice" do
      expect(helper.flash_class("notice")).to eq("alert-dark")
    end

    it "returns the correct class for error" do
      expect(helper.flash_class("error")).to eq("alert-danger")
    end

    it "returns the correct class for alert" do
      expect(helper.flash_class("alert")).to eq("alert-warning")
    end
  end
end