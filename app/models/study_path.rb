class StudyPath < ApplicationRecord
	has_and_belongs_to_many :course_modules
	has_many :users_study_paths
	has_many :users, through: :users_study_paths
end
