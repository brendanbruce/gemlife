require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:user_id).scoped_to(:event_id) }
  end

  describe "associations" do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end
end
