class SubscriptionMailer < ApplicationMailer
  def send_email(subscribe)
    @subscription=subscribe
    mail(to: 'info@bequent.com',from: subscribe.email)

  end
end
