class CourseMailchimpListSubscriber
  include Sidekiq::Worker

  def perform(user, course)
    Mailchimp::Lists::SubscribeUserToCourseUpdates.call(user: user,
                                                        course: course)
  end
end
