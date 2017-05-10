class CourseModule < ApplicationRecord
	has_many :belongings
	has_many :courses, through: :belongings

	has_and_belongs_to_many :study_paths
end
