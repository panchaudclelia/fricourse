class StudyPath < ApplicationRecord

  	validates :name, presence: true, uniqueness: { case_insensitive: true }
	has_and_belongs_to_many :course_modules
	has_many :users
end
