module ConsumersSection
  class StoreController < ApplicationController
    def index
      @stocks = ConsumersSection::Products::Stock.all
      @cart = current_cart
      @line_item = ConsumersSection::LineItem.new
      @order = ConsumersSection::Order.new
    end
  end
end
