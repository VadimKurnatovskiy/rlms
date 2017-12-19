class LearnersMailer < ApplicationMailer
  def notify_inactive(user)
    @user = user
    mail(to: user.email)
  end
end
