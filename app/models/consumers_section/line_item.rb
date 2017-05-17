module ConsumersSection
  class LineItem < ApplicationRecord
    belongs_to :cart, class_name: "ConsumersSection::Cart"
    belongs_to :order, class_name: "ConsumersSection::Order"
    belongs_to :stock, class_name: "ConsumersSection::Products::Stock"
    validates :quantity, presence: true, numericality: { greater_than: 0.1 }
    delegate :product_name, to: :stock, allow_nil: true
    delegate :unit, to: :stock, allow_nil: true
    delegate :member_full_name, to: :order
    delegate :order_date, to: :order

    def self.cash
      all.select{ |a| a.cash? }
    end
    def self.credit
      all.select{ |a| a.credit? }
    end
    def self.total_cost
      all.to_a.sum{ |a| a.total_cost }
    end


    def cash?
      order.cash?
    end

    def credit?
      order.credit?
    end

    def self.total_cost
      all.to_a.sum { |a| a.total_cost }
    end
    def total_cost
      unit_cost * quantity
    end

    def profit
      unit_cost - stock.purchase_cost
    end
  end
end
