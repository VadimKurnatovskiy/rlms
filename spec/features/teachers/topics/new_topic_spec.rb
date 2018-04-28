require "rails_helper"

feature "Teacher creates new topic", :js => true do
  include_context "teacher signed in"

  let(:course_attributes) { attributes_for(:course) }
  let(:topic_attributes) { attributes_for(:topic) }
  let(:course) { create :course }
  let(:topic) { create :topic, course: course }

  background do
    visit teachers_courses_path
    click_on "Create new course"
  end

  scenario "with valid parameters" do
    fill_in :course_title, with: "title"
    fill_in :course_slug, with: "slugs11"
    fill_in :course_description, with: "description"

    click_button "Create Course"

    fill_in :topic_title, with: "qwerty"
    fill_in :topic_slug, with: "slug1"
    click_button "Add topic"
    visit '/teachers/topics/slug1'
    #click_on "qwerty"

    expect(page).to have_content "Материалы"
  end

end
