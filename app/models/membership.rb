class Membership < ActiveRecord::Base
	##Relationships
	belongs_to :student, class_name: 'User', foreign_key: 'student_id'
    belongs_to :group
end
