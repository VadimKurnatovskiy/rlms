module Teachers
  class CoursesController < BaseController
    respond_to :html

    COURSE_PARAMS = %i[title slug description published]

    expose :course, find_by: :slug, id: :slug
    expose :courses, from: :current_teacher

    def index
      respond_with courses
    end

    def new; end

    def create
      course.teacher = current_teacher
      course.save

      respond_with :teachers, course
    end

    def destroy
      if course.topics.empty?
        course.destroy
      end
      redirect_to teachers_courses_path
    end

    def show
      respond_with course
    end

    def edit; end

    def update
      course.update(course_params)

      respond_with :teachers, course
    end

    private

    def course_params
      params.require(:course).permit(*COURSE_PARAMS)
    end
  end
end
