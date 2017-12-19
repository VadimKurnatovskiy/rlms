module Learners
  class NotifyInactive
    include Interactor
    delegate :users, to: :context

    def call
      notify_inactive_users
    end

    private

    def notify_inactive_users
      users.each(&:notify)
    end

    def users
      @users ||= Learner.where('last_sign_in_at < ?', Date.today - 7.days)
    end

    def notify(user)
      LearnersMailer.notify_inactive(user)
    end
  end
end
