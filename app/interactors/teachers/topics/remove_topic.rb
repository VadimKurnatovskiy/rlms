module Teachers
  module Topics
    class RemoveTopic
      include Interactor
      delegate :topic, :teacher, to: :context

      def call
        if author_of_course? && have_content?
          topic.save
          context.fail!(message: "Тема скрыта, так как в теме есть материалы, вопросы или домашние задания")
        else
          topic.destroy
        end
      end

      private

      def author_of_course?
        topic.course.teacher == teacher
      end

      def have_content?
        topic.materials.present? || topic.questions.present? || topic.tasks.present?
      end
    end
  end
end
