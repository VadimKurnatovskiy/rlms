class CourseParticipation < ApplicationRecord
  belongs_to :course
  belongs_to :learner

  validates :course_id, :learner_id, presence: true
  validates :course_id, uniqueness: { scope: :learner_id }
end
