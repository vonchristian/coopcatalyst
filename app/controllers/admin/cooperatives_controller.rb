module Admin
  class CooperativesController < ApplicationController
    def new
      @cooperative = Cooperative.new
    end
    def create
      @cooperative = Cooperative.create(cooperative_params)
      if @cooperative.save
        redirect_to @cooperative, notice: "saved successfully"
      else
        render :new
      end
    end
    def show
      @cooperative = Cooperative.find(params[:id])
    end 
    private
    def cooperative_params
      params.require(:cooperative).permit(:name, :address, :contact_number)
    end
  end
end
