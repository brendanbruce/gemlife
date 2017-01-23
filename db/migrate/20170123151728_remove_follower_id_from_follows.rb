class RemoveFollowerIdFromFollows < ActiveRecord::Migration
  def up
    remove_column :follows, :follower_id
  end

  def down
    add_column :follows, :follower_id, :integer
  end
end
