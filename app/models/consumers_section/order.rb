module ConsumersSection
  class Order < ApplicationRecord
    has_one :discount, as: :discountable
    belongs_to :member
    belongs_to :user
    has_many :refunds, as: :refundable
    has_many :line_items, class_name: "ConsumersSection::LineItem"
    enum pay_type: [:cash, :credit]

    delegate :amount, :percent, :amount?, :percent?, to: :discount, prefix: true, allow_nil: true

    def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
      end
    end
    def total_cost
      line_items.total_cost
    end
    #move to discount
    def total_discount
      Discount.total(self)
    end
    #move to discount
    def discounted?
      discount.present?
    end
    def discountable_amount
      total_cost
    end
    #move to decorators
    def pay_type_color
      if cash?
        "success"
      elsif credit?
        "danger"
      end
    end
  end
end
