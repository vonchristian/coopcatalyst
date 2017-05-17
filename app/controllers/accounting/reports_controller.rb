module Accounting
  class ReportsController <  ApplicationController
    def index
    end
     def balance_sheet
      first_entry = Accounting::Entry.order('entry_date ASC').first
      @from_date = first_entry ? first_entry.entry_date: Date.today
      @to_date = params[:date] ? Date.parse(params[:date]) : Date.today
      @assets = Accounting::Asset.all
      @liabilities = Accounting::Liability.all
      @equity = Accounting::Equity.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

    # @example
    #   GET /reports/income_statement
    def income_statement
      @from_date = params[:from_date] ? Date.parse(params[:from_date]) : Date.today.at_beginning_of_month
      @to_date = params[:to_date] ? Date.parse(params[:to_date]) : Date.today
      @revenues = Accounting::Revenue.all
      @expenses = Accounting::Expense.all

      respond_to do |format|
        format.html # index.html.erb
        format.pdf do
          pdf = IncomeStatementPdf.new(@revenues, @expenses,  @from_date, @to_date, view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Income Statement.pdf"
        end
      end
    end
  end
end
