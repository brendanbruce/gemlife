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
    it { should validate_uniqueness_of(:profile_id).scoped_to([:followable_type, :followable_id]) }
  end

  describe "assocations" do
    it { should belong_to(:profile) }
    it { should belong_to(:followable) }
  end

  describe "#followable_id_for" do
    it "should return ActiveRecord object of instance" do
      profile = create(:profile)
      venue = create(:venue)
      follow = create(:follow, profile_id: profile.id, followable_id: venue.id, followable_type: venue.class.name)

      expect(follow.followable_id_for).to eq Venue.find(venue.id)
    end
  end
end
