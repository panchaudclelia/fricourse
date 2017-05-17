class RenameUsersIdinUsersCoursestoUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :users_courses, :users_id, :user_id
    rename_column :users_courses, :courses_id, :course_id
  end
end
