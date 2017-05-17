class UsersStudyPath < ApplicationRecord
  belongs_to :study_path
	belongs_to :user
end
