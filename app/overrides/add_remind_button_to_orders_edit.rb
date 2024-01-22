Deface::Override.new(:virtual_path  => "spree/admin/orders/_order_actions",
                     :insert_after => "erb[silent]:contains('if can?(:resend, order)')",
                     :text          => "<%= button_link_to Spree.t(:remind), remind_admin_order_url(order), method: :post, icon: 'envelope' unless order.complete? %>",
                     :name          => "reminder_email_button")

module AddRemindButtonToOrdersEdit
end
