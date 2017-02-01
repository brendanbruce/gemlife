require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "factory" do
    it "has a valid factory" do
      create(:follow).should be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of(:profile_id) }
    it { should validate_presence_of(:followable_id) }
    it { should validate_presence_of(:followable_type) }
  end

  describe "assocations" do
    it { should belong_to(:profile) }
  end
end
