require "rails_helper"

feature "Sign Up" do
  let(:teacher_attributes) { attributes_for(:teacher).slice(:first_name, :last_name, :email, :password, :password_confirmation) }
  let(:registered_teacher) { Teacher.find_by(email: teacher_attributes[:email]) }

  scenario "Visitor signs up" do
    visit new_teacher_registration_path

    fill_in :teacher_first_name, with: teacher_attributes[:first_name]
    fill_in :teacher_last_name, with: teacher_attributes[:last_name]
    fill_in :teacher_email, with: teacher_attributes[:email]
    fill_in :teacher_password, with: teacher_attributes[:password]
    fill_in :teacher_password_confirmation, with: teacher_attributes[:password_confirmation]

    click_button "Sign up"

    open_email(registered_teacher.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_teacher.email)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(registered_teacher.full_name)
  end
end
