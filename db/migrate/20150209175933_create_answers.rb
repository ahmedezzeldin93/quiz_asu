class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :question_id
    	t.string :title
    	t.boolean :correctness, default: false
      	
      	t.timestamps null: false
    end
  end
end
