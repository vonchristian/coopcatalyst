module Members
  class CommonShareCapitalsController < ApplicationController
    def new
      @member = Member.find(params[:member_id])
      @share_capital = @member.build_common_share_capital
    end
    def create
      @member = Member.find(params[:member_id])
      @share_capital = @member.create_common_share_capital(share_capital_params)
      @share_capital.branch = current_user.branch
      if @share_capital.save
        redirect_to @member, notice: "Common Share Capital Account subscribed successfully."
      else
        render :new
      end
    end

    private
    def share_capital_params
      params.require(:share_capitals_common).permit(:account_number)
    end
  end
end
