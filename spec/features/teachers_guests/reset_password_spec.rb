require "rails_helper"

feature "Password Reset" do
  let(:new_password) { "qwe123" }
  let(:teacher) { create :teacher }

  def update_password
    fill_in :teacher_password, with: new_password
    fill_in :teacher_password_confirmation, with: new_password
    click_button "Change password"
  end

  scenario "Visitor resets his password" do
    visit new_teacher_session_path

    click_link "Forgot your password?"

    fill_in :teacher_email, with: teacher.email
    click_button "Send me reset password instructions"

    open_email(teacher.email)

    expect(current_email).to have_subject("Reset password instructions")
    expect(current_email).to have_body_text(teacher.email)

    visit_in_email("Change my password")
    update_password

    expect(page).to have_content("Your password has been changed successfully")
  end
end
