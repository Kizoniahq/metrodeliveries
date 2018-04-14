class OrderMailer < ApplicationMailer
  default :from => "customersupport@metrodeliveries.co"
  def order_email(user, order)
    @user = user
    @order = order
     mail(to: user.email, subject: 'Your order Has Been Created')
  end
end
