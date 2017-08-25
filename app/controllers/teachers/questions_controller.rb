module Teachers
  class QuestionsController < BaseController
    respond_to :html

    expose :question
    expose :topic

    def create
      question.topic = topic
      question.save

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def update
      question.update_attributes(question_params)

      redirect_back fallback_location: teachers_topic_path(question.topic)
    end

    def destroy
      question.destroy

      redirect_back fallback_location: teachers_topic_path(question.topic)
    end

    private

    def question_params
      params.require(:question).permit(:title)
    end
  end
end
