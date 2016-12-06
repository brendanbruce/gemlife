require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :name => "DJ Brendan"
    ))

    @venue = assign(:venue, Venue.create!(
      :name => "Trophy"
    ))

    @event = assign(:event, Event.create!(
      :title => "MyTitle",
      :description => "EventDescription",
      :start_date => Date.today,
      :start_time => Time.now,
      :venue_id => @venue.id,
      :profile => @profile.name
    ))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/MyTitle/)
    expect(rendered).to match(/EventDescription/)
    expect(rendered).to match(/DJ Brendan/)
  end
end
