module TimeDeposits
  class DepositsController < ApplicationController
    def new
      @time_deposit = Members::TimeDeposit.find(params[:time_deposit_id])
      @entry = Accounting::Entry.new
      @entry.debit_amounts.build
      @entry.credit_amounts.build
    end
    def create
      @time_deposit = Members::TimeDeposit.find(params[:time_deposit_id])
      @entry = Accounting::Entry.create(entry_params)
      @entry.commercial_document = @time_deposit
      @entry.recorder = current_user
      if @entry.save
        redirect_to time_deposit_url(@time_deposit), notice: "deposited successfully"
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
