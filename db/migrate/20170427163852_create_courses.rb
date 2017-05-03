class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :semester
      t.string :name
      t.string :name_english
      t.string :description
      t.string :code
      t.string :language
      t.string :lecturer
      t.string :assistant
      t.string :level
      t.integer :hours_per_week
      t.float :ects
      t.text :goals
      t.string :references
      t.string :frequency
      t.string :time_schedule
      t.string :number_of_students
      t.string :softskill_students
      t.boolean :free_auditor
      t.string :erasmus_students
      t.string :condition
      t.string :examination_regulation
      t.string :exam_session
      t.datetime :exam_date
      t.string :type_of_evaluation
      t.string :exam_duration
      t.string :exam_language
      t.string :study_program

      t.timestamps
    end
  end
end
