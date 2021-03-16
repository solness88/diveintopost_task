class ApplicationMailer < ActionMailer::Base
  default to: -> { @agenda_user.pluck(:email) },
          from: 'solness.stf@gmail.com'
  layout 'mailer'
end
