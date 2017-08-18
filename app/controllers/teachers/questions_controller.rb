module Teachers
  class QuestionsController < BaseController
    respond_to :html

    expose :topic
    expose :question

    def create
      question.save

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def update
      question.update_attributes(question_params)

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def destroy
      question.destroy

      redirect_back fallback_location: teachers_topic_path
    end

    private

    def question_params
      params.require(:question)
            .permit(:title)
            .merge({ topic_id: topic.id })
    end
  end
end
