class Group < ActiveRecord::Base
	##Relationships
	belongs_to :instructor, :class_name => "User", :foreign_key => "instructor_id"
	has_many :quizzes
	has_many :memberships
	#Validations
	validates :group_name, presence: true
end
