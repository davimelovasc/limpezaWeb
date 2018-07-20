class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.references :task_has_spot, foreign_key: true
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
