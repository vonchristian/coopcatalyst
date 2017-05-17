module CoopServices
  class SavingsProductsController < ApplicationController
    def new
      @savings_product = CoopServices::SavingsProduct.new
    end
    def create
      @savings_product = CoopServices::SavingsProduct.create(savings_product_params)
      if @savings_product.save
        redirect_to coop_services_url, notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def savings_product_params
      params.require(:coop_services_savings_product).permit(:name, :interest_rate)
    end
  end
end
