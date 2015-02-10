class User < ActiveRecord::Base

  before_save :ensure_authentication_token
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
	

	#A method used to bypass confirmation step after creating a new userx
	def skip_confirmation!
	  self.confirmed_at = Time.now
	end
   

end





class Student< User
	##Relationships
	has_many    :memberships ,foreign_key: 'student_id'
	has_and_belongs_to_many :answers, join_table: :students_answers, foreign_key: :student_id

	##Methodes
	def self.model_name
		User.model_name
	end

end




class Instructor< User
	##Relationships
	has_many    :groups
    has_many    :quizzs

    ##Methodes
    def self.model_name
		User.model_name
	end
end