class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to users_url, notice: 'Employee registered successfully.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def info
    @user = User.find(params[:id])
  end
  def activities
    @user = User.find(params[:id])
  end

  def sales
    @user = User.find(params[:id])
    @sales = @user.orders.page(params[:page]).per(50)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation, :avatar)
  end
end
