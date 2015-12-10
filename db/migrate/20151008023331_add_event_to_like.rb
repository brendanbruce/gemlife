class AddEventToLike < ActiveRecord::Migration
  def change
    add_column :likes, :event_id, :integer
  end
end
