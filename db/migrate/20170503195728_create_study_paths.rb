class CreateStudyPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :study_paths do |t|
      t.string :name

      t.timestamps
    end
  end
end
