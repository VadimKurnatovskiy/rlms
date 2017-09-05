class UpdateCoursesSlugs < ActiveRecord::Migration[5.1]
  def change
    Course.all.each {|course| course.update_attribute(:slug, "course_#{course.id}") }
  end
end
