class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :car, foreign_key: true
      t.references :rental_user, foreign_key: true
      t.references :trip, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
