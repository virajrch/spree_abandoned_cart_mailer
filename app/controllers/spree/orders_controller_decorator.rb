module Spree
  module OrdersControllerDecorator
    def self.prepended(base)
      base.before_action :restore_cart, only: :edit
    end

    def restore_cart
      if params[:cart_token].present?
        @order = current_order || Spree::Order.incomplete.find_or_initialize_by(token: params[:cart_token])
        if @order.user
          redirect_to spree.login_url if spree_current_user.blank?
        elsif @order.email
          cookies.signed[:token] = params[:cart_token]
        end if @order
      end
    end
  end
end
Spree::OrdersController.prepend Spree::OrdersControllerDecorator
