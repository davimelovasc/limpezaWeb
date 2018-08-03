class CreateTaskHasSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :task_has_spots do |t|
      t.references :spot, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
