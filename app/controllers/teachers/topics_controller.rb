module Teachers
  class TopicsController < BaseController
    respond_to :html

    TOPIC_PARAMS = %i[title slug order_index published]

    expose :course, find_by: :slug, id: :course_slug
    expose :topic

    def show; end

    def create
      result = Topics::Build.call(topic: topic, course: course)

      flash[:alert] = result.message unless result.success?

      respond_with :teachers, course
    end

    def edit; end

    def update
      topic.update(topic_params)

      respond_with :teachers, topic.course
    end

    def destroy
      result = Topics::RemoveTopic.call(topic: topic, teacher: current_teacher)

      flash[:alert] = result.message unless result.success?

      respond_with :teachers, topic.course
    end

    private

    def topic_params
      params.require(:topic).permit(*TOPIC_PARAMS)
    end
  end
end
