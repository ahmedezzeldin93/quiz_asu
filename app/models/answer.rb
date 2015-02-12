class Answer < ActiveRecord::Base
	##Relationships
	belongs_to :question
	has_and_belongs_to_many :students, join_table: :students_answers, foreign_key: :answer_id
end

class RightAnswer< Answer
	belongs_to :question
end