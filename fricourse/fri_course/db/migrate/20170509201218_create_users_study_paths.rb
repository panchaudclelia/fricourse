class CreateUsersStudyPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :users_study_paths do |t|
    	t.belongs_to :study_path
    	t.belongs_to :users
    end
  end
end
