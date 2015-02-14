class Quiz < ActiveRecord::Base
	##Relationships
	belongs_to :instructor, class_name: 'Instructor', foreign_key: 'instructor_id'
	belongs_to :group
	has_many :assignments
	has_many :students, through: :assignments, class_name: 'User', foreign_key: 'student_id'
	has_many :questions
	has_many :answers, through: :questions
	

	##Validations
	validates_presence_of :title
	validates_presence_of :total_score


	##Methodes
	#def render_quiz_all(options={ })
	#	as_json(:only => [:id, :title, :subject, :year, :description, :marks, :created_ar],
	#			:include => {:questions => {:on ly => [:id, :title]}}
	#			)
	#end

end
