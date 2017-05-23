class ChangeUserStudyPathRelation < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :study_path
    add_column :users, :study_path_id, :integer
    add_index :users, :study_path_id
    drop_table :users_study_paths
  end
end
