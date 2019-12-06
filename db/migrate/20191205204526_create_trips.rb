class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.decimal :lat_origin
      t.decimal :long_origin
      t.decimal :lat_destination
      t.decimal :long_destination
      t.decimal :price
      t.string :address_origin
      t.string :address_destination

      t.timestamps
    end
  end
end
