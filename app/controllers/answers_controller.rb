class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    @answers = Answer.all
    respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
    @answer = []
    (0...4).each {|i| @answer << Answer.new }
    respond_with(@answer)
  end

  def edit
  end

  def create
     @question = Question.find(params[:p])
     binding.pry
    (0...4).each do |i|
      @answer = @question.answers.new(:answer => params["answer"]["#{i}"], :correct => (params["correct[#{i}]"] == 1) )
      @answer.save
    end
    redirect_to subject_questions_path(@question.subject)
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer)
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:answer, :correct, :question_id)
    end
end
