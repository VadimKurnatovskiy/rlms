require 'rails_helper'

describe Administrator do
  subject { create(:administrator) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  describe "#full_name" do
    it { expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}") }
  end
end
