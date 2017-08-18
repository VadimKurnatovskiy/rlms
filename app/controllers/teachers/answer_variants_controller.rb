module Teachers
  class AnswerVariantsController < BaseController
    respond_to :html

    expose :question
    expose :topic, from: :question
    expose :answer_variant

    def create
      answer_variant.save

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def update
      answer_variant.update_attributes(answer_variant_params)

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def destroy
      answer_variant.destroy

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    private

    def answer_variant_params
      params.require(:answer_variant)
            .permit(:text, :correct)
            .merge({ question_id: question.id })
    end
  end
end
