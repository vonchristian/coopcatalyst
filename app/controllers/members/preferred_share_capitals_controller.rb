module Members
  class PreferredShareCapitalsController < ApplicationController
    def new
      @member = Member.find(params[:member_id])
      @share_capital = @member.build_preferred_share_capital
    end
    def create
      @member = Member.find(params[:member_id])
      @share_capital = @member.create_preferred_share_capital(preferred_share_capital_params)
      @share_capital.branch = current_user.branch
      if @share_capital.save
        redirect_to @member, notice: "Share Capital Account saved successfully."
      else
        render :new
      end
    end

    private
    def preferred_share_capital_params
      params.require(:share_capitals_preferred).permit(:account_number)
    end
  end
end
