require 'rails_helper'

describe Topic do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :course_id }
end
