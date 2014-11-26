class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

	def index
		@questions = Question.all
	end

	def show
	end

	def show_all
	end

	def new
		@question = Question.new
	end
	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to @question
		else
			render :new
		end
	end

	def update
		if @question.update(question_params)
			redirect_to @question
		else
			render :edit
		end
	end

	def destroy
		@question.destroy
		redirect_to questions_url
	end

	private

	def set_question
		@question = Question.find(params[:id])
	end

	def question_params
		params.require(:question).permit(:question_id, :question_text)
	end

end
