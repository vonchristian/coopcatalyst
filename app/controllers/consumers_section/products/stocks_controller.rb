module ConsumersSection
  module Products
    class StocksController < ApplicationController
      def new
        @product = ConsumersSection::Product.find(params[:product_id])
        @stock = @product.stocks.build
        @stock.build_discount
        @stock.build_freight_in

      end
      def create
        @product = ConsumersSection::Product.find(params[:product_id])
        @stock = @product.stocks.create(stock_params)
        @stock.user = current_user
        if @stock.save
          redirect_to consumers_section_stock_url(@stock), notice: "saved successfully"
        else
          render :new
        end
      end
      private
      def stock_params
        params.require(:consumers_section_products_stock).permit(:supplier_id, :quantity, :purchase_cost, :date_purchased, :has_freight,  :discounted, :expiry_date, discount_attributes: [:amount, :discount_type, :percent], freight_in_attributes: [:amount])
      end
    end
  end
end
