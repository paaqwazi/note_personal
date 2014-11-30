class RemoveQuestionIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_id, :integer
  end
end
