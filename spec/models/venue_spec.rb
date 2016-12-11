require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe "factory" do
    it "has a valid factory" do
      create(:venue).should be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:events) }
  end
end
