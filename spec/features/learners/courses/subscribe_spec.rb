require "rails_helper"

feature "Learner subscribes to course" do
  include_context "learner signed in"
  let!(:available_course) { create(:course, :published) }

  background do
    visit learners_available_courses_path
  end

  scenario "course is added to my courses page" do
    byebug
    expect(page).to have_content "Мои курсы [0]"
    click_button "Подписаться на курс"
    expect(page).to have_content "Мои курсы [1]"
  end
end
