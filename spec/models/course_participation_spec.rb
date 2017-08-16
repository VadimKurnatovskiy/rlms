require 'rails_helper'

describe CourseParticipation do
  it { is_expected.to validate_presence_of :course_id }
  it { is_expected.to validate_presence_of :learner_id }

  it { is_expected.to validate_uniqueness_of(:course_id).scoped_to(:learner_id) }

  it { is_expected.to belong_to :course }
  it { is_expected.to belong_to :learner }
end
