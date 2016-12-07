require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, create(:event, title: "MyText", event_link: "Event Link"))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_event_link[name=?]", "event[event_link]"
    end
  end
end
