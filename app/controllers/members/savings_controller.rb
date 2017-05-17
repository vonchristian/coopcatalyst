module Members
  class SavingsController < ApplicationController
    def new
      @member = Member.find(params[:member_id])
      @saving = @member.savings.build
    end
    def create
      @member = Member.find(params[:member_id])
      @saving = @member.savings.create(saving_params)
      @saving.branch = current_user.branch
      if @saving.save
        redirect_to @member, notice: "Savings Account opened successfully."
      else
        render :new
      end
    end

    private
    def saving_params
      params.require(:members_saving).permit(:savings_product_id, :date_opened, :account_number)
    end
  end
end
