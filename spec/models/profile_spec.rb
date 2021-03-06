require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:gigs) }
    it { should have_many(:events).through(:gigs) }
  end
end
