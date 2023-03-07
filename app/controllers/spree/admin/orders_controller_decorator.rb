module Spree
  module Admin
    module OrdersControllerDecorator
      def self.prepended(base)
        base.before_action :load_order, only: [:remind]
      end

      def remind
        Spree::AbandonedCartMailer.reminder_email(@order.id).deliver_later
        flash[:success] = Spree.t('abandoned_cart_mailer.reminder_email.email_sent')
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
Spree::Admin::OrdersController.prepend Spree::Admin::OrdersControllerDecorator
