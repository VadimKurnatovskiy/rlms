require "rails_helper"

describe Teacher do
  subject { create(:teacher) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  it { is_expected.to have_many :courses }

  describe "#full_name" do
    it { expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}") }
  end
end
