class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :course

  #scope :course_module_filter, -> (course_module)

  def self.filter(cm)
    recs = Recommendation.pluck(:course_id)
    bels_list = Belonging.where(course_module_id: cm)
    bels = bels_list.pluck(:course_id)
    @recommendations = Recommendation.where(course_id: recs & bels)
  end

end
