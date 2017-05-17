module ConsumersSection
  class PurchasesController < ApplicationController
    def new
      @cart = current_cart
      @products = ConsumersSection::Product.all
      @line_item = ConsumersSection::LineItems::PurchaseOrderLineItem.new
    end
  end
end
