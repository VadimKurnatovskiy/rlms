class CourseParticipation < ApplicationRecord
  belongs_to :course
  belongs_to :learner
end
