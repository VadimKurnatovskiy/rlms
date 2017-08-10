module Api
  module V1
    class TopicsController < Api::V1::BaseController
      respond_to :json

      TOPIC_PARAMS = %i[title description order_index]

      expose :topic

      def update
        topic.update_attributes(topic_params)
        topic.save

        respond_with topic
      end

      private

      def topic_params
        params.require(:topic).permit(*TOPIC_PARAMS)
      end
    end
  end
end
