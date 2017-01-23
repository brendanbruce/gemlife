class AddProfileReferenceToFollowsTable < ActiveRecord::Migration
  def change
    add_reference :follows, :profile, index: true
  end
end
