class AnswersController < ApplicationController

	def create
		@answer = Answer.new(answer_params)
		@answer.save
		redirect_to questions_path
	end

 private
    def answer_params
      params.require(:answer).permit(:answer).merge(respond_id: session[:id], question_id: session[:question_id])
    end

end