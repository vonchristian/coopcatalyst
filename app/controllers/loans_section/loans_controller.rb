module LoansSection
  class LoansController < ApplicationController
    def new
      @member = Member.find(params[:member_id])
      @loan = @member.loans.build
    end
    def create
      @member = Member.find(params[:member_id])
      @loan = @member.loans.create(loan_params)
      @loan.branch = current_user.branch
      if @loan.save
        redirect_to @member, notice: "Loan application filed successfully."
      else
        render :new
      end
    end

    def index
      @loans = LoansSection::Loan.all
    end
    def show
      @loan = LoansSection::Loan.find(params[:id])
    end
    private
    def loan_params
      params.require(:loans_section_loan).permit(:loan_product_id, :amount, :application_date)
    end
  end
end
