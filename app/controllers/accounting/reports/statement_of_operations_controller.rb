class Reports::StatementOfOperationsController < ApplicationController
  def index
   @accounts = Accounting::Account.all
   @year  = Time.zone.now
    respond_to do |format|
      format.html
      format.pdf do
        pdf = StatementOfOperationsPdf.new(@accounts,  @year, view_context)
        send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "statement_of_operations.pdf"
      end
    end
  end
end
