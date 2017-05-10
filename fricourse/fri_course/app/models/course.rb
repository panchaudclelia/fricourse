class Course < ApplicationRecord
	has_many :belongings
	has_many :course_modules, through: :belongings
end
