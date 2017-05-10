class CreateUsersCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :users_courses do |t|
    	t.belongs_to :courses
    	t.belongs_to :users
    	t.string :grade
    end
  end
end
