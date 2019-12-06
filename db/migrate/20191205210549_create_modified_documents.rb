class CreateModifiedDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :modified_documents do |t|
      t.decimal :price
      t.decimal :lat_destination
      t.decimal :long_destination
      t.string :address
      
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
