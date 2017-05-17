module ConsumersSection
  class DeliveriesController < ApplicationController
    def new
      @purchase_order = ConsumersSection::PurchaseOrder.find(params[:purchase_order_id])
      @stock = ConsumersSection::Products::Stock.new
    end
  end
end
