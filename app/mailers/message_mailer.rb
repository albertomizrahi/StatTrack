class MessageMailer < ActionMailer::Base
  default to: "support@stattrack.me"

  def contact_us_message(message)
    @message = message
    mail :from => message.email, :subject => "Contact Us Email"
  end
end
