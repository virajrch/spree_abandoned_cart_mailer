Spree::Admin::OrdersController.class_eval do

  before_action :load_order, only: [:remind]

  def remind
    Spree::AbandonedCartMailer.reminder_email(@order.id).deliver_later
    flash[:success] = Spree.t('abandoned_cart_mailer.reminder_email.email_sent')
    redirect_back(fallback_location: root_path)
  end
end