class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
    end
  end
end
