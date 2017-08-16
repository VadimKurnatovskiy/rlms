shared_context "teacher signed in" do
  let(:current_teacher) { create :teacher }

  background do
    login_as current_teacher, scope: :teacher
  end
end
