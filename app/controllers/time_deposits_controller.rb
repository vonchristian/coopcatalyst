class TimeDepositsController < ApplicationController
  def index
    @time_deposits = Members::TimeDeposit.all
  end
  def show
  end
end
