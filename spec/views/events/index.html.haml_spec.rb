require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      create(:event, title: "MyText", event_link: "Event Link"),
      create(:event, title: "MyText", event_link: "Event Link")
    ])
  end

  it "renders a list of events" do
    render
    assert_select ".event__header__title", text: "MyText".to_s, :count => 2
  end
end
