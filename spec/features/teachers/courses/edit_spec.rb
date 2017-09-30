require "rails_helper"

feature "Teacher edits course" do
  include_context "teacher signed in"

  let(:course) { create(:course, teacher: current_teacher) }

  background do
    visit teachers_course_path(course)
    click_on "Edit course settings"
  end

  scenario "with valid parameters" do
    fill_in :course_title, with: "New title"
    fill_in :course_description, with: "New description"

    click_button "Update Course"

    expect(page).to have_content "New title"
    expect(page).to have_content "New description"
  end

  scenario "with empty title" do
    fill_in :course_title, with: ""
    fill_in :course_description, with: "New description"

    click_button "Update Course"

    expect(page).to have_content "can't be blank"
  end

  scenario "with empty descrtiption" do
    fill_in :course_title, with: "New title"
    fill_in :course_description, with: ""

    click_button "Update Course"

    expect(page).to have_content "can't be blank"
  end
end
