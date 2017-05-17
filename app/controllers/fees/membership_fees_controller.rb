module Fees
  class MembershipFeesController < ApplicationController
    def new
      @member = Member.friendly.find(params[:member_id])
      @membership_fee = @member.build_membership_fee
    end
    def create
      @member = Member.friendly.find(params[:member_id])
      @membership_fee = @member.create_membership_fee(membership_fee_params)
      if @membership_fee.save
        redirect_to @member, notice: "Membership fee paid successfully."
      else
        render :new
      end
    end

    private
    def membership_fee_params
      params.require(:fees_membership_fee).permit(:amount)
    end
  end
end
