class Reports::FinancialStatementController < ApplicationController
  def index
   @accounts = Accounting::Account.all
   @year  = Time.zone.now
    respond_to do |format|
      format.html
      format.pdf do
        pdf = FinancialStatementPdf.new(@accounts,  @year, view_context)
        send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "financial_statement.pdf"
      end
    end
  end
end
