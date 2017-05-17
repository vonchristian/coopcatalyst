module ConsumersSection
  class Cart < ApplicationRecord
    belongs_to :user
    has_many :line_items, class_name: "ConsumersSection::LineItem", dependent: :destroy
    has_many :stocks, through: :line_items, class_name: "ConsumersSection::Products::Stock"
    def add_line_item(line_item)
      if self.stocks.include?(line_item.stock)
        self.line_items.where(stock_id: line_item.stock.id).delete_all
        # replace with a single item
        create_line_item(line_item)
      else
        create_line_item(line_item)
      end
    end

    private
    def create_line_item(line_item)
      self.line_items.create!(stock_id: line_item.stock.id, quantity: line_item.quantity, pricing_type: line_item.pricing_type, unit_cost: line_item.unit_cost, user_id: self.user_id)
    end
  end
end
