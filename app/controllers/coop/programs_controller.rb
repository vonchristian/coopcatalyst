module Coop
  class ProgramsController < ApplicationController
    def new
      @program = Coop::Program.new
    end
    def create
      @program = Coop::Program.create(program_params)
      @program.cooperative = current_user.cooperative
      if @program.save
        redirect_to coop_settings_url, notice: "created successfully"
      else
        render :new
      end
    end
    private
    def program_params
      params.require(:coop_program).permit(:name, :contribution_amount, :default)
    end
  end
end
