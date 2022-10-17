module Spree
  class AbandonedCartMailer < BaseMailer

    def reminder_email(order)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @cart_url = spree.cart_url(host: Spree::Store.default.url)+"?cart_token=#{@order.token}"
      subject = "#{Spree.t('abandoned_cart_mailer.reminder_email.subject')}"
      mail(to: @order.email, from: from_address, subject: subject)
    end
  end
end