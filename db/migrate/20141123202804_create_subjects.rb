class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :lecturer
      t.string :subject_code

      t.timestamps
    end
  end
end
