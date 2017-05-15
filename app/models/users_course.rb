class UsersCourse < ApplicationRecord
	belongs_to :course, optional: true
	belongs_to :user, optional: true
end
