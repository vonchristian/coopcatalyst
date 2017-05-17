module Savings
  class WithdrawalsController < ApplicationController
    def new
      @saving = Members::Saving.find(params[:saving_id])
      @entry = Accounting::Entry.new
      @entry.debit_amounts.build
      @entry.credit_amounts.build
    end
    def create
      @saving = Members::Saving.find(params[:saving_id])
      @entry = Accounting::Entry.create(entry_params)
      @entry.commercial_document = @saving
      @entry.recorder = current_user
      if @entry.save
        redirect_to saving_url(@saving), alert: "withdrawn successfully"
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
