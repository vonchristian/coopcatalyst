module Coop
  class BranchesController < ApplicationController
    def new
      @cooperative = Cooperative.find(params[:cooperative_id])
      @branch = @cooperative.branches.build
    end
    def create
      @cooperative = Cooperative.find(params[:cooperative_id])
      @branch = @cooperative.branches.create(branch_params)
      if @branch.save
        redirect_to coop_settings_url, notice: "created successfully."
      else
        render :new
      end
    end

    def show
      @branch = Coop::Branch.friendly.find(params[:id])
    end

    private
    def branch_params
      params.require(:coop_branch).permit(:name, :address, :contact_number, :branch_type)
    end
  end
end
