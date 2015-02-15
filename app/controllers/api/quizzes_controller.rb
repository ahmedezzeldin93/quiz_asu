module API
class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /quizzes
  # GET /quizzes.json
  def index
    if params[:instructor_id].present?
      @quizzes = Quiz.where("instructor_id IN (?)", params[:instructor_id]) 
    end
    if params[:group_id].present?
      group = Group.find_by_id(params[:group_id])
      @quizzes = group.quizzes
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz=Quiz.find(params[:id])
    render json: @quiz.as_json(:only => [:id, :title, :subject,:description, :total_mark],
        :include => {:questions => {:only => [:id, :title],:methods => [:add_answers]},})
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      
      if @quiz.update(quiz_params)
        id_of_assigned_group = @quiz.group_id
        assigned_group = Group.find_by_id(id_of_assigned_group)
        @memberships = assigned_group.memberships
        @memberships.each do |mem|
          id_of_assigned_student = mem.student_id
          @assignment = Assignment.create(:student_id =>id_of_assigned_student,:quiz_id=>@quiz.id, :status=>true)
        end

        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:title, :subject, :description, :total_score, :instructor_id,:status,:group_id,:date_to_publish, :time_to_publish, :duration)
    end
end
end