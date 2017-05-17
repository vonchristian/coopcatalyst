module ConsumersSection
  module Products
    class Stock < ApplicationRecord
      has_one :discount, as: :discountable
      has_one :freight_in, as: :freightable, class_name: "Freights::FreightIn"
      belongs_to :product, class_name: "ConsumersSection::Product"
      belongs_to :supplier
      belongs_to :user
      has_many :line_items, class_name: "ConsumersSection::LineItem"

      delegate :name, :unit,  to: :product, prefix: true, allow_nil: true
      delegate :unit, to: :product
      delegate :first_name, :full_name, to: :user, prefix: true, allow_nil: true
      delegate :full_name, to: :supplier, prefix: true, allow_nil: true
      delegate :business_name, to: :supplier, prefix: true, allow_nil: true
      delegate :amount, :percent, :amount?, :percent?, to: :discount, prefix: true, allow_nil: true
      delegate :amount, to: :freight_in, prefix: true, allow_nil: true


      accepts_nested_attributes_for :discount
      accepts_nested_attributes_for :freight_in
      #move THIS METHOD TO SALES REPORT
      def self.total
        all.sum(:quantity)
      end

      def self.cash_sales
        all.collect{|a| a.line_items.cash}
      end

      def self.sold
        all.sum{ |a| a.sold }
      end
      def self.in_stock
        all.sum{ |a| a.in_stock }
      end
      def total_cost
        (quantity * purchase_cost) + total_freight_in - total_discount
      end

      def discountable_amount
        purchase_cost * quantity
      end

      def total_discount
        Discount.total(self)
      end
      def total_freight_in
        Freight.total(self)
      end
      def discounted?
        discount.present?
      end

      def in_stock
        quantity - sold
      end
      def sold
        line_items.sum(:quantity)
      end
    end
  end
end
