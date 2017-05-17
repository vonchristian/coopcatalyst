module LoansSection
  module Settings
    class LoanApproversController < ApplicationController
      def new
        @loan_approver = LoansSection::LoanApprover.new
      end
      def create
        @loan_approver = LoansSection::LoanApprover.create(loan_approver_params)
        if @loan_approver.save
          redirect_to new_loans_section_loan_approver_url, notice: "saved successfully."
        else
          render :new
        end
      end

      private
      def loan_approver_params
        params.require(:loans_section_loan_approver).permit(:user_id)
      end
    end
  end
end 
