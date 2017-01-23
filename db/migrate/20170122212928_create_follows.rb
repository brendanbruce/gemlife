class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :followable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
