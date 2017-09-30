require "rails_helper"

feature "Update Account" do
  include_context "teacher signed in"

  background do
    visit edit_teacher_registration_path(current_teacher)
  end

  scenario "teacher enters not matched passwords" do
    fill_in :teacher_password, with: "qwerty"
    fill_in :teacher_password_confirmation, with: "123123"
    click_on "Save changes"

    expect(page).to have_content("doesn't match Password")
  end
end
