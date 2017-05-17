module ConsumersSection
  class PurchaseOrder < ApplicationRecord
    belongs_to :user
    belongs_to :product
    has_many :line_items,  class_name: "ConsumersSection::LineItems::PurchaseOrderLineItem", as: :orderable
    def add_line_items_from_cart(cart)
      cart.purchase_order_line_items.each do |item|
        item.cart_id = nil
        line_items << item
      end
    end
  end
end
