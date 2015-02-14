class Question < ActiveRecord::Base
	##Relationships
	   belongs_to  :quiz
	   has_many    :answers, dependent: :destroy
      belongs_to  :right_answer, class_name: 'Answer',foreign_key: 'right_answer_id'
   	accepts_nested_attributes_for :answers
   	accepts_nested_attributes_for :right_answer

   	#Callbacks
   	#after_create :add_right_answer_to_answers

   	#Validations
   	validates_presence_of :title

   	##Methodes
	def add_right_answer_to_answers
		self.answers << right_asnwer
	end
	
end
