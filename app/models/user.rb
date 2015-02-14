class User < ActiveRecord::Base

  before_save :ensure_authentication_token
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
	

    ##Validation
	validates :username, presence: true, uniqueness: true
	validates :type, presence: true

	##A method used to bypass confirmation step after creating a new userx
	def skip_confirmation!
	  self.confirmed_at = Time.now
	end
   
end





class Student< User
	##Relationships
	has_many :memberships
	has_many :groups, through: :memberships
	has_many :assignments
	has_many :quizzes, through: :assignments 
	has_and_belongs_to_many :answers, join_table: :students_answers, foreign_key: :student_id


	##Methodes
	def self.model_name
		User.model_name
	end

	def answer_quiz(answers_id, quiz_id)
        current_score = 0
        answers_id.each do |answer_id|
            answer = Answer.find(answer_id)
            if answer.correctness
            	current_score = current_score + 1
            end
        end
        final_score = current_score.to_f / Quiz.find(quiz_id).questions.count * Quiz.find(quiz_id).total_score
    end
end



class Instructor< User
	##Relationships
	has_many :groups
    has_many :quizzes

    ##Methodes
    def self.model_name
		User.model_name
	end
end