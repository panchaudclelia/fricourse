class User < ApplicationRecord
  has_many :users_courses
  has_many :courses, through: :users_courses
  belongs_to :study_path
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
