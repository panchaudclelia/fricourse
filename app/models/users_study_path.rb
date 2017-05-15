class UsersStudyPath < ApplicationRecord
	# has_many :belongings
	# has_many :courses, through: :belongings
  #
	# has_and_belongs_to_many :study_paths
  belongs_to :study_path
	belongs_to :user
end
