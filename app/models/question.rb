class Question < ActiveRecord::Base
	##Relationships
	belongs_to  :quiz
	has_many    :answers, dependent: :destroy
   	has_one  :right_answer, class_name: 'Answer',foreign_key: 'right_answer_id'
end
