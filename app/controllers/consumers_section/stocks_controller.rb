module ConsumersSection
  class StocksController < ApplicationController
    def index
      if params[:name]
        @stocks = ConsumersSection::Products::Stock.search_by_name(params[:name]).page(params[:page]).per(50)
      else
        @stocks =  ConsumersSection::Products::Stock.includes(:product).order('date_purchased DESC').all.page(params[:page]).per(50)
      end
    end
    def new
      @stock =  ConsumersSection::Products::Stock.new
      @stock.build_discount
      @stock.build_freight_in
    end
    def create
      @stock =  ConsumersSection::Products::Stock.create(stock_params)
      if @stock.save
        redirect_to consumers_section_stocks_path, notice: "saved successfully."
      else
        render :new
      end
    end
    def show
      @stock = ConsumersSection::Products::Stock.find(params[:id])
    end

    private
    def stock_params
      params.require(:consumers_section_products_stock).permit(:product_id, :supplier_id, :quantity, :purchase_cost, :date_purchased, :has_freight,  :discounted, :expiry_date, discount_attributes: [:amount, :discount_type, :percent], freight_in_attributes: [:amount])
    end
  end
end
