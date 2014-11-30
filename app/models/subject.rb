class Subject < ActiveRecord::Base
	
	belongs_to :admin
	has_many :questions
end
