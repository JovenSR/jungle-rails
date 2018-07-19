class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.comm'

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: @order.id)
  end
end
