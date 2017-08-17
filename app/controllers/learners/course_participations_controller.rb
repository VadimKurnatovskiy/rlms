module Learners
  class CourseParticipationsController < BaseController
    respond_to :html

    expose :course_participation

    def create
      course_participation.save

      redirect_back fallback_location: learner_root_path
    end

    def destroy
      course_participation.update_attributes(course_participation_params)

      redirect_back fallback_location: learner_root_path
    end

    private

    def course_participation_params
      params.require(:course_participation)
            .permit(:course_id)
            .merge({ learner_id: current_learner.id })
    end
  end
end
