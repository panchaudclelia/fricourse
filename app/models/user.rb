class User < ApplicationRecord
  has_many :users_courses
  has_many :courses, through: :users_courses
  has_many :users_study_paths
  has_many :study_paths, through: :users_study_paths
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
