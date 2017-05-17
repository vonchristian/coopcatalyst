class SuppliersController < ApplicationController
  def index
  end
  def new
    @supplier = Supplier.new
    @supplier.build_business
  end
  def create
    @supplier = Supplier.create(supplier_params)
    if @supplier.save
      redirect_to suppliers_url, notice: "saved successfully"
    else
      render :new
    end
  end
  private
  def supplier_params
    params.require(:supplier).permit(:first_name, :last_name, :contact_number, business_attributes: [:name, :address, :contact_number])
  end
end
