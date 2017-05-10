class CreateCourseModulesStudyPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :course_modules_study_paths do |t|
    	t.belongs_to :study_path
    	t.belongs_to :course_module
    end
  end
end
