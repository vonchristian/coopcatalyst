module Admin
  class DepartmentsController < ApplicationController
    def new
      @cooperative = Cooperative.find(params[:cooperative_id])
      @department = @cooperative.departments.build
    end
    def create
      @cooperative = Cooperative.find(params[:cooperative_id])
      @department = @cooperative.departments.create(department_params)
      if @department.save
        redirect_to @cooperative, notice: "Department created successfully."
      else
        render :new
      end
    end

    private
    def department_params
      params.require(:department).permit(:name)
    end
  end
end
