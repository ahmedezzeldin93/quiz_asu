class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :student_id
      t.integer :quiz_id
      t.integer :score
      t.string :summary
      t.boolean :status

      t.timestamps null: false
    end
  end
end
