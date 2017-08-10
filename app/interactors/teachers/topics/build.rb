module Teachers
  module Topics
    class Build
      include Interactor

      delegate :topic, :course, to: :context

      def call
        build!
        context.failure! unless topic.save
      end

      private

      def build!
        topic.course = course
        topic.order_index = next_order_index
      end

      def next_order_index
        maximum_order_index = course.topics.maximum(:order_index)
        maximum_order_index ? maximum_order_index + 1 : 0
      end
    end
  end
end
