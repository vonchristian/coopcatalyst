module LoansSection
  module Loans
    class PaymentsController < ApplicationController
      def new
        @loan = LoansSection::Loan.find(params[:loan_id])
        @entry = Accounting::Entry.new
        @entry.debit_amounts.build
        @entry.credit_amounts.build
      end
      def create
        @loan = LoansSection::Loan.find(params[:loan_id])
        @entry = Accounting::Entry.create(entry_params)
        @entry.commercial_document = @loan
        @entry.recorder = current_user
        @entry.department = current_user.department
        if @entry.save
          redirect_to loans_section_loan_url(@loan), notice: "saved successfully"
        else
          render :new
        end
      end
      private
      def entry_params
        params.require(:accounting_entry).permit(:entry_date, :reference_number, :description, debit_amounts_attributes: [:id, :amount, :account_id], credit_amounts_attributes: [:id, :amount, :account_id])
      end
    end
  end
end
