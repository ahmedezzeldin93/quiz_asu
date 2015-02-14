class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :quiz_id, null: false
      t.integer :right_answer_id
      t.string :title
      	
      t.timestamps null: false
    end
  end
end
