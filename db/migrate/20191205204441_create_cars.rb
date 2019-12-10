class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :property_document
      t.string :plate
      t.string :color
      t.string :model
      t.string :year
      t.string :brand
      t.references :owner, foreign_key: true
        
      t.timestamps
    end
  end
end
