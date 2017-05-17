class ShareCapitalsController < ApplicationController
  def index
    @share_capitals = Members::ShareCapital.all
  end
  def show
  end
end
