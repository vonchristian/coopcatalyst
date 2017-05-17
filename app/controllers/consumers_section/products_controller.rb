module ConsumersSection
  class ProductsController < ApplicationController
    def index
      @products = ConsumersSection::Product.all
    end
    def new
      @product = ConsumersSection::Product.new
    end
    def create
      @product = ConsumersSection::Product.create(product_params)
      if @product.save
        redirect_to consumers_section_product_url(@product), notice: "created successfully."
      else
        render :new
      end
    end

    def show
      @product = ConsumersSection::Product.find(params[:id])
    end

    private
    def product_params
      params.require(:consumers_section_product).permit(:name, :description, :stock_alert, :unit, :product_category_id)
    end
  end
end
