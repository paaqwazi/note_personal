class Question < ActiveRecord::Base
validates :question_text, :presence=>true

	belongs_to :subject
	has_many :answers
end
