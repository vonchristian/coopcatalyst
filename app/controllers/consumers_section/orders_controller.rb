module ConsumersSection
  class OrdersController < ApplicationController
    def index
      @orders = ConsumersSection::Order.all
    end
    def new
      @cart = current_cart
      @order = ConsumersSection::Order.new
    end
    def create
      @order = ConsumersSection::Order.create(order_params)
      @order.user = current_user
      @order.add_line_items_from_cart(current_cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to consumers_section_store_index_url, notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def order_params
      params.require(:consumers_section_order).permit(:order_date, :pay_type, :member_id, :reference_number)
    end
  end
end
