class ContactMailer < ApplicationMailer
  def contact_me(message)
    @message = message
    # mail(to: 'racheldesmarest@thefrenchbrit.com', subject: 'Contact me')
    mail(to: 'occuly.guillaume@gmail.com', from: @message.email, subject: 'Contact me')
  end
end
