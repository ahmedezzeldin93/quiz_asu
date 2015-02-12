class CreateRightAnswer < ActiveRecord::Migration
  def change
    create_table :right_answers do |t|
    	t.integer :question_id
    	t.string :right_asnwer
    end
  end
end
