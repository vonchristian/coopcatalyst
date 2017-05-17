module LoansSection
  module Loans
    class ApprovalsController < ApplicationController
      def new
        @loan = LoansSection::Loan.find(params[:loan_id])
        @approval = @loan.loan_approvals.build
      end
      def create
        @loan = LoansSection::Loan.find(params[:loan_id])
        @approval = @loan.loan_approvals.create(approval_params)
        @approval.approver_id = current_user.id
        if @approval.save
          redirect_to loans_section_loan_url(@loan), notice: "Loan approved successfully"
        else
          render :new
        end
      end
      private
      def approval_params
        params.require(:loans_section_loan_approval).permit(:date, :reference_number, :remarks)
      end
    end
  end
end
