require 'rails_helper'

RSpec.describe User, type: :model do
  describe "assocations" do
    it { should have_many(:likes) }
    it { should have_many(:events).through(:likes) }
    it { should have_many(:events) }
    it { should have_one(:profile) }
  end
end
