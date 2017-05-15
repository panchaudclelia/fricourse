class Course < ApplicationRecord
	has_many :belongings
	has_many :course_modules, through: :belongings
	has_many :users, through: :users_courses
	has_many :users_courses
end
