module ConsumersSection
  class PurchaseOrderLineItemsController < ApplicationController
    def create
      @cart = current_cart
      @line_item = @cart.purchase_order_line_items.create(line_item_params)
      if @line_item.save
        redirect_to new_consumers_section_purchase_url, notice: "Added to cart."
      else
        redirect_to new_consumers_section_purchase_url
      end
    end

    private
    def line_item_params
      params.require(:consumers_section_line_items_purchase_order_line_item).permit(:quantity, :itemable_id, :itemable_type, :unit_cost, :user_id)
    end
  end
end
