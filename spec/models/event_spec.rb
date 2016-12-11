RSpec.describe Event, type: :model do
  describe "factory" do
    it "has a valid factory" do
      create(:event).should be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:start_time) }
  end

  describe "assocations" do
    it { should belong_to(:user) }
    it { should belong_to(:venue) }
    it { should accept_nested_attributes_for(:venue) }
    it { should have_many(:gigs) }
    it { should have_many(:profiles).through(:gigs) }
    it { should accept_nested_attributes_for(:gigs) }
    it { should accept_nested_attributes_for(:profiles) }
  end

  describe ".likes_count" do
    it "should return the number of likes on an event" do
      event = create(:event)
      user1 = create(:user)
      user2 = create(:user)
      like1 = create(:like, user_id: user1.id, event_id: event.id)
      like2 = create(:like, user_id: user2.id, event_id: event.id)

      expect(event.likes_count).to eq 2
    end
  end
end
