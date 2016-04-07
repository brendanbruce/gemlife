class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :bio
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :soundcloud
      t.string :mixcloud
      t.boolean :dj

      t.timestamps
    end
  end
end
