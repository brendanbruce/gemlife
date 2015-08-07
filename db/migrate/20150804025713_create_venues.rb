class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :twitter_url
      t.string :facebook_url
      t.string :website_url

      t.timestamps null: false
    end
  end
end
