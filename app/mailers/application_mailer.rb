class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@rlms.herokuapp.com'
  layout 'mailer'
end
