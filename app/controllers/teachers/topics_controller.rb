module Teachers
  class TopicsController < BaseController
    respond_to :html

    TOPIC_PARAMS = %i[title description]

    expose :course
    expose :topic

    def create
      topic.course = course
      topic.save

      respond_with :teachers, course
    end

    private

    def topic_params
      params.require(:topic).permit(*TOPIC_PARAMS)
    end
  end
end
