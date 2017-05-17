module LoansSection
  class ImbursementsController < ApplicationController
    def index
      @transactions = current_user.entries
    end
  end
end
