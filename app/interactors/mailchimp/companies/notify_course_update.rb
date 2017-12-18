module Mailchimp
  module Companies
    class NotifyCourseUpdate
      delegate :topic

      def call
        notify
      end

      private

      def notify
        gibbon.companies(company_id).actions.send.create
      end

      def company_id
        gibbon.companies.create(body: params).retrieve.body['id']
      end

      def params
        {
          type: 'regular'
          recipients: {
            list_id: list_id
          },
          settings: {
            title: "#{topic.course.title} update",
            subject_line: "#{topic.course.title} was updated"
          },
          template: {
            id: template_id,
            sections: {
              'course-title': topic.course.title,
              'topic-title': topic.title
            }
          }
        }
      end

      def template_id
        gibbon.templates.retrieve.body['templates'].find do |template|
          template['name'] == ENV['COURSE_UPDATE_NOTIFICATION_TEMPLATE']
        end['id']
      end

      def list_id
        list_name = "course_#{topic.course.id}"
        list_by_name(list_name)['id']
      end
    end
  end
end
