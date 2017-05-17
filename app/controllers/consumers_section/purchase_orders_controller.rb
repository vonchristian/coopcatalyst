module ConsumersSection
  class PurchaseOrdersController < ApplicationController
    def index
      @purchase_orders = ConsumersSection::PurchaseOrder.all
    end
    def new
      @cart = current_cart
      @purchase_order = ConsumersSection::PurchaseOrder.new
    end
    def create
      @purchase_order = ConsumersSection::PurchaseOrder.create(purchase_order_params)
      @purchase_order.user = current_user
      @purchase_order.add_line_items_from_cart(current_cart)
      if @purchase_order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to consumers_section_purchase_orders_url, notice: "saved successfully."
      else
        render :new
      end
    end
    def show
      @purchase_order = ConsumersSection::PurchaseOrder.find(params[:id])
    end
    private
    def purchase_order_params
      params.require(:consumers_section_purchase_order).permit(:tracking_number, :supplier_id, :date)
    end
  end
end
