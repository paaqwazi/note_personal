class QuestionsController < ApplicationController
	before_action :set_subject, only: [:create, :edit, :new, :index, :destroy]
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

	def index
		@questions = Question.where(subject_id: @subject.id)
		@questions.sort {|a,b| a.question_text <=> b.question_text}

		respond_to do |format| 
			format.html
			
		end
	end

	def show
	end

	def show_all
	end

	def new
		@question = @subject.questions.build
	end

	def create
		@question = @subject.questions.new(question_params)
		if @question.save

			redirect_to "/answers/new?q=#{@question.id}"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @question.update(question_params)
			redirect_to subject_questions_path
		else
			render :edit
		end
	end

	def destroy
		@question.destroy
		redirect_to subject_questions_path
	end

	private

	def set_question
		@question = Question.find(params[:id])
	end

	def set_subject
		@subject = Subject.find(params[:subject_id])
	end

	def question_params
		params.require(:question).permit(:question_text)
	end

end
