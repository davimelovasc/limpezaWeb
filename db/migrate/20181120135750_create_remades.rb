class CreateRemades < ActiveRecord::Migration[5.1]
  def change
    create_table :remades do |t|
      t.references :observation, foreign_key: true

      t.timestamps
    end
  end
end
