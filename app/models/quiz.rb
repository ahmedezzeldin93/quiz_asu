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

	scope :published,-> { where(status: true) }
end
