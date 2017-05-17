class MembersController < ApplicationController
  def index
    @members = current_branch.members.all
  end
  def new
    @member = Member.new
    authorize @member
  end
  def create
    @member = Member.create(member_params)
    @member.branch = current_user.branch
    if @member.save
      redirect_to @member, notice: "Member saved successfully."
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    if @member.save
      redirect_to @member, notice: "updated successfully."
    else
      render :edit
    end
  end

  def show
    @member = Member.friendly.find(params[:id])
    @relationship = @member.active_relationships.build
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth, :contact_number, :civil_status, :avatar)
  end
end
