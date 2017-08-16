require 'rails_helper'

describe CourseParticipation do
  it { is_expected.to belong_to :course }
  it { is_expected.to belong_to :learner }
end
