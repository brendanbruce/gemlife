require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :description => "MyText",
        :event_link => "Event Link"
      ),
      Event.create!(
        :description => "MyText",
        :event_link => "Event Link"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Event Link".to_s, :count => 2
  end
end
