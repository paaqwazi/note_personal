class AddAdminIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :admin_id, :integer
  end
end
