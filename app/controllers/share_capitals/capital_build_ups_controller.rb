module ShareCapitals
  class CapitalBuildUpsController < ApplicationController
    def new
      @share_capital = Members::ShareCapital.find(params[:share_capital_id])
      @entry = Accounting::Entry.new
      @entry.debit_amounts.build
      @entry.credit_amounts.build
    end
    def create
      @share_capital = Members::ShareCapital.find(params[:share_capital_id])
      @entry = Accounting::Entry.create(entry_params)
      @entry.commercial_document = @share_capital
      @entry.recorder = current_user
      if @entry.save
        redirect_to share_capital_url(@share_capital), notice: "deposited successfully"
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
