module CoopServices
  class TimeDepositProductsController < ApplicationController
    def new
      @time_deposit_product = CoopServices::TimeDepositProduct.new
    end
    def create
      @time_deposit_product = CoopServices::TimeDepositProduct.create(time_deposit_product_params)
      if @time_deposit_product.save
        redirect_to coop_services_url, notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def time_deposit_product_params
      params.require(:coop_services_time_deposit_product).permit(:starting, :ending, :interest_rate, :name)
    end
  end
end
