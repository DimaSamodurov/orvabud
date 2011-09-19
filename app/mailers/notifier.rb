# encoding: utf-8
class Notifier < ActionMailer::Base
  default :from => "service@orvabud.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_submitted.subject
  #
  def order_submitted(order)
    @order = order
    mail :subject => "Замовлення", :to => "service@orvabud.com"
  end
end
