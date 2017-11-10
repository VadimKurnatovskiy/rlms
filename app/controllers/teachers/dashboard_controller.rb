module Teachers
  class DashboardController < BaseController
    respond_to :html

    expose :course, find_by: :slug, id: :slug
    expose :courses, from: :current_teacher

    def show 
      @total_students = 0
      current_teacher.courses.each do |course|
        @total_students += course.learners.count
      end
     respond_with courses, @total_students
    end
  end
end
