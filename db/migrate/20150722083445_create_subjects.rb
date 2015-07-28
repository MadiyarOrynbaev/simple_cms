class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.integer :position
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
