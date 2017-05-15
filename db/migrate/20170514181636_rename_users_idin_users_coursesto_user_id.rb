class RenameUsersIdinUsersCoursestoUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :users_study_paths, :users_id, :user_id
  end
end
