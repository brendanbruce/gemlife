require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:start_time) }

  it { should belong_to(:venue) }
  it { should accept_nested_attributes_for(:venue) }

  it { should have_many(:gigs) }
  it { should have_many(:profiles).through(:gigs) }
  it { should accept_nested_attributes_for(:gigs) }
  it { should accept_nested_attributes_for(:profiles) }

  describe ".likes_count" do
    it "should return the number of likes on an event" do
   
    end
  end
end
