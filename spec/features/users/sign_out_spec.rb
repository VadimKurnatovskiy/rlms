require "rails_helper"

feature "Sign Out" do
  include_context "teacher signed in"

  scenario "teacher signs out" do
    visit "/"

    click_on current_teacher.full_name

    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
