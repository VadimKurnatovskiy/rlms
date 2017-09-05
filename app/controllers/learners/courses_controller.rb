module Learners
  class CoursesController < BaseController
    respond_to :html

    expose :course, find_by: :slug, id: :slug
    expose :courses, from: :current_learner

    def index; end

    def show; end
  end
end
