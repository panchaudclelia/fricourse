class User < ApplicationRecord
  has_many :users_courses
  has_many :courses, through: :users_courses
  #belongs_to :study_path
  belongs_to :study_path
  #has_one :study_path, through: :users_study_paths


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def after_database_authentication
    # here's the custom code22
    if !study_path.nil? && Recommendation.where(:user_id => id).length == 0
      @calc_curr_user = CalculationService.new(id)
      @recommendations = @calc_curr_user.calculateTfidfMatrix.sort_by { |k, v| -v }
    end
  end
end
