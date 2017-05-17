module ConsumersSection
  class LineItemsController < ApplicationController
    def create
      @cart = current_cart
      @line_item = @cart.line_items.create(line_item_params)
      if @line_item.save
        @cart.add_line_item(@line_item)
        redirect_to consumers_section_store_index_url, notice: "Added to cart."
      else
        redirect_to consumers_section_store_index_url
      end
    end

    private
    def line_item_params
      params.require(:consumers_section_line_item).permit(:quantity, :stock_id, :unit_cost, :user_id)
    end
  end
end
