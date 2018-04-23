module Teachers
  module Topics
    class RemoveTopic
      include Interactor
      delegate :topic, :teacher, to: :context

      def call
        return if  topic_have_content?
        topic.destroy
      end
    end
  end
end
