class AddProfileToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :profile_id, :integer
    remove_column :gigs, :user_id, :integer
  end
end
