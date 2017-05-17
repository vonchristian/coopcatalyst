module LoansSection
  module Loans
    class DisbursementsController < ApplicationController
      def new
        @loan = LoansSection::Loan.find(params[:loan_id])
        @disbursement = @loan.build_disbursement
      end
      def create
        @loan = LoansSection::Loan.find(params[:loan_id])
        @disbursement = @loan.create_disbursement(disbursement_params)
        @disbursement.user = current_user
        if @disbursement.save
          redirect_to loans_section_loan_url(@loan), notice: "Loan disbursed successfully."
        else
          render :new
        end
      end

      private
      def disbursement_params
        params.require(:disbursement).permit(:date, :reference_number)
      end
    end
  end
end
