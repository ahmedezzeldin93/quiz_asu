class CreateMemberhsips < ActiveRecord::Migration
  def change
    create_table :memberhsips do |t|
      t.integer :student_id
      t.integer :group_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
