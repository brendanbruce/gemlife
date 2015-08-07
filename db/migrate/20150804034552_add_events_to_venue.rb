class AddEventsToVenue < ActiveRecord::Migration
  def change
    add_reference :events, :venue, index: true
    add_foreign_key :events, :users
  end
end
