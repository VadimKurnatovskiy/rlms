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

    def show
      respond_with course
    end

    def edit; end

    def update
      course.update(course_params)

      respond_with :teachers, course
    end

    private

    # def find_course_by_id_or_slug
    #   params[:slug] ? find_by_slug : find_by_id
    # end

    # def find_by_slug
    #   Course.find_by_slug(params[:slug])
    # end

    # def find_by_id
    #   Course.find(params[:id])
    # end

    def course_params
      params.require(:course).permit(*COURSE_PARAMS)
    end
  end
end
