require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  describe "#current_date" do
    it "should return the current date" do
      date = current_date
      today = Date.today
      expect(date).to eq today
    end
  end

  describe "#current_day" do
    it "should return given date as a day" do
      today = current_date.strftime("%A")
      expect(today).to eq current_day
    end
  end

  describe "#event_flyer_image" do
    it "should return nil if no flyer is present" do
      event = build(:event)
      expect(event.flyer.url).to be nil
    end
  end
end
