module Mailchimp
  module Lists
    class SubscribeUserToCourseUpdates
      include Interactor
      include Mailchimp::Base
      delegate :user, :course, to: :context

      def call
        subscribe
      end

      private

      def subscribe
        gibbon.lists(list_id).members(hashed_email(user.email)).upsert(subscriber_params)
      end

      def list_id
        @list_id ||= fetch_list("course_#{course.id}")['id']
      end

      def fetch_list(list_name)
        list_by_name(list_name) || create_new_list(list_name)
      end

      def create_new_list(list_name)
        params = {
          list_name: list_name,
          reminder: "You're receiving this email because you signed up for the course #{course.title}",
          from_name: course.teacher.first_name,
          from_email: course.teacher.email,
          subject: "New topic added to the course #{course.title}",
        }

        Mailchimp::Lists::Create.call(params)
      end

      def hashed_email(email)
        Digest::MD5.new.hexdigest(email)
      end

      def subscriber_params
        {
          body: {
            email_address: user.email,
            status: 'subscribed'
          }
        }
      end
    end
  end
end
