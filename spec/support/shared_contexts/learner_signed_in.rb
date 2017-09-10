shared_context "learner signed in" do
  let(:current_learner) { create :learner }

  background do
    login_as current_learner, scope: :learner
  end
end
