class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :instructor_id, null: false
      t.integer :group_id
      t.string :title, null: false
      t.string :subject
      t.string :description
      t.integer :total_score
      t.date :date_to_publish
      t.time :time_to_publish
      t.boolean :status, default: false
      t.integer :duration

      t.timestamps null: false
    end
  end
end
