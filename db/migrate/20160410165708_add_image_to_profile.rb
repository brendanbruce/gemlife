class AddImageToProfile < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :image
  end

  def self.down
    remove_attachment :profiles, :image
  end
end
