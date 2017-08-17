module Learners
  class AvailableCoursesController < BaseController
    respond_to :html

    expose :available_courses, from: :current_learner

    def index; end
  end
end
