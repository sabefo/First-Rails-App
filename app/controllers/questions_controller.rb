class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.save
		redirect_to questions_path
	end

	def show
		session[:question_id] = params[:id]
		@question = Question.find(session[:question_id])
		@answers = @question.answers
		@answer = Answer.new
		# render question_path
	end

	def answers_question
	end

	def my_questions
		@questions = current_user.questions
	end

 private
    def question_params
      params.require(:question).permit(:question).merge(author_id: session[:id])
    end
end
