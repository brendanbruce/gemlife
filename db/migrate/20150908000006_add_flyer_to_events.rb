class AddFlyerToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :flyer
  end

  def self.down
    remove_attachment :events, :flyer
  end
end
