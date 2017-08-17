module Learners
  class CoursesController < BaseController
    respond_to :html

    expose :course
    expose :courses, from: :current_learner

    def index; end

    def show; end
  end
end
