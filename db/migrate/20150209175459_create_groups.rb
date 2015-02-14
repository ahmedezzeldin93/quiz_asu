class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.integer :instructor_id, null: false
    	t.string :group_name, null: false
    	t.string :description
    	t.integer :number_of_students
    	
    	t.timestamps null: false
    end
  end
end
