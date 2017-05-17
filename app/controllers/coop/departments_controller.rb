module Coop
  class DepartmentsController < ApplicationController
    def new
      @branch = Coop::Branch.find(params[:branch_id])
      @department = @branch.departments.build
    end
    def create
      @branch = Coop::Branch.find(params[:branch_id])
      @department = @branch.departments.create(department_params)
      if @department.save
        redirect_to coop_branch_url(@branch), notice: "Department created successfully"
      else
        render :new
      end
    end

    def show
      @department = Coop::Department.find(params[:id])
    end

    private
    def department_params
      params.require(:coop_department).permit(:name)
    end
  end
end
