module Members
  class TimeDepositsController < ApplicationController
    def new
      @member = Member.find(params[:member_id])
      @time_deposit = @member.time_deposits.build
    end
    def create
      @member = Member.find(params[:member_id])
      @time_deposit = @member.time_deposits.create(time_deposit_params)
      @time_deposit.branch = current_user.branch
      if @time_deposit.save
        redirect_to @member, notice: "Time Deposit Account opened successfully."
      else
        render :new
      end
    end

    private
    def time_deposit_params
      params.require(:members_time_deposit).permit(:time_deposit_product_id, :date_opened, :account_number)
    end
  end
end
