module Teachers
  class CoursesController < BaseController
    respond_to :html

    COURSE_PARAMS = %i[title slug description published archived]

    expose :course, find_by: :slug, id: :slug
    expose(:courses) { fetch_courses }

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

    def course_params
      params.require(:course).permit(*COURSE_PARAMS)
    end
    
    def fetch_courses
      params[:archived]== 'true' ? current_teacher.courses.archived : current_teacher.courses.not_archived
      end
    end
  end
