class SavingsController < ApplicationController
  def index
    @savings = Members::Saving.all
  end
  def show
  end
end
