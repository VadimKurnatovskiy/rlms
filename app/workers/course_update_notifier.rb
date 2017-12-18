class CourseUpdateNotifier
  include Sidekiq::Worker

  def perform(topic)
    Mailchimp::Companies::NotifyCourseUpdate.call(topic: topic)
  end
end
