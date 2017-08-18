require 'rails_helper'

describe Question do
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to belong_to(:topic)}
end
