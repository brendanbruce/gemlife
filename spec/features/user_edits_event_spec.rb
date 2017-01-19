require "rails_helper"

RSpec.feature "user edits an event", type: :feature do
  scenario "user sees edit button when logged in" do
    user = create(:user)
    event = create(:event, user_id: user.id)

    login_as(user, scope: :user)
    visit events_path(as: user)

    expect(page).to have_link("Edit")
  end

  scenario "user does not see edit button when not logged in" do
    user = create(:user)
    event = create(:event, user_id: user.id)

    visit events_path

    expect(page).to_not have_link("Edit")
  end

  scenario "user does not see edit button when user did not create event" do
    user = create(:user)
    user2 = create(:user)
    event = create(:event, user_id: user2.id)

    login_as(user, scope: :user)
    visit events_path(as: user)

    expect(page).to_not have_link("Edit")
  end

  scenario "user visits edit page from the index page" do
    user = create(:user)
    event = create(:event, user_id: user.id)

    login_as(user, scope: :user)
    visit events_path(as: user)
    click_link_or_button("Edit")

    expect(page).to have_css("#edit_event_#{event.id}")
  end

  scenario "user updates event" do
    user = create(:user)
    event = create(:event, user_id: user.id)
    updated_title = "Crazy Since da 90s be Jammin"
    updated_venue = event.venue

    login_as(user, scope: :user)
    visit edit_event_path(event.id, as: user)

    fill_in("Title", with: updated_title)
    click_link_or_button("Post Your Party!")


    expect(page).to have_content(updated_title)
  end
end
