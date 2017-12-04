class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_RECIPIENT']
  layout 'mailer'
end
