class StudyPath < ApplicationRecord
	has_and_belongs_to_many :course_modules
end
