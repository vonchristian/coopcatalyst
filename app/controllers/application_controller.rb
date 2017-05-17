class ApplicationController < ActionController::Base
  include Pundit
  include PublicActivity::StoreController
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  helper_method :current_branch, :current_department
  def after_sign_in_path_for(current_user)
    if current_user.loan_officer?
      coop_branch_url(current_user.branch)
    end
  end
  def after_sign_out_path_for(current_user)
    home_index_url
  end

  private

  def current_branch
    branch = Coop::Branch.find(current_user.branch.id)
    session[:branch_id] = branch.id
    branch
  end
  def current_department
    department = Coop::Department.find(current_user.department.id)
    session[:department_id] = department.id
    department
  end
  def current_cart
    ConsumersSection::Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = ConsumersSection::Cart.create(user_id: current_user.id)
    session[:cart_id] = cart.id
    cart
  end

    def permission_denied
    redirect_to  after_sign_in_path_for(current_user), alert: "We're sorry but you are not allowed to access this page or feature."
  end
end
