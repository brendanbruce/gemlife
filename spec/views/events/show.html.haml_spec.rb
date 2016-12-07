require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @venue = create(:venue, name: "Trophy")
    @event = assign(:event, create(:event, title: "MyTitle", description: "EventDescription", venue_id: @venue.id))

    profile = create(:profile, name: "DJ Brendan")
    gig = assign(:gig, create(:gig, event_id: @event.id, profile_id: profile.id))

  end

  it "renders attributes" do
    render

    expect(rendered).to match(/MyTitle/)
    expect(rendered).to match(/EventDescription/)
    expect(rendered).to match(/DJ Brendan/)
  end
end
