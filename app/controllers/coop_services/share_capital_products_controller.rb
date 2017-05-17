module CoopServices
  class ShareCapitalProductsController < ApplicationController
    def new
      @share_capital_product = CoopServices::ShareCapitalProduct.new
    end
    def create
      @share_capital_product = CoopServices::ShareCapitalProduct.create(share_capital_product_params)
      if @share_capital_product.save
        redirect_to coop_services_url, notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def share_capital_product_params
      params.require(:coop_services_share_capital_product).permit(:minimum_paid_up_share_capital)
    end
  end
end 
