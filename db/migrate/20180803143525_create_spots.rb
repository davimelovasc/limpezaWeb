class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :light_cleaning
      t.string :heavy_cleaning
      t.string :governance
      t.string :lat
      t.string :long
      t.integer :status
      t.references :user, foreign_key: true

      t.datetime :deleted_at

      t.timestamps
    end
    add_index :spots, :deleted_at
  end
end
