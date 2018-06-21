class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com',
    return_path: 'system@example.com'

  def order_summary_email(order)
    @account = order
    mail(to: order.email,
      bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end
end
