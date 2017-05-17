module LoansSection
  module Settings
    class LoanProductsController < ApplicationController
      def new
        @loan_product = CoopServices::LoanProduct.new
      end
      def create
        @loan_product = CoopServices::LoanProduct.create(loan_product_params)
        if @loan_product.save
          redirect_to loans_section_settings_url, notice: "saved successfully."
        else
          render :new
        end
      end

      private
      def loan_product_params
        params.require(:coop_services_loan_product).permit(:name, :interest_rate, :term)
      end
    end
  end
end
