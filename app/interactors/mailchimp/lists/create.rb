module Mailchimp
  module Lists
    class Create
      include Interactor
      include Mailchimp::Base
      delegate :list_name, :reminder, :from_name, :from_email, :subject, to: :context

      def call
        create_new_list
      end

      private

      def create_new_list
        gibbon.lists.create(body: params).retrieve.body
      end

      def params
        {
          name: list_name,
          contact: {
            company: 'RLMS',
            address1: 'Kremlevskaya 35',
            city: 'Kazan',
            state: 'Tatarstan',
            zip: '420014',
            country: 'Russia'
          },
          permission_reminder: reminder,
          campaign_defaults: {
            from_name: from_name,
            from_email: from_email,
            subject: subject,
            language: 'en'
          },
          email_type_option: true
        }
      end
    end
  end
end
