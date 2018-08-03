class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.references :task_has_spot, foreign_key: true
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
