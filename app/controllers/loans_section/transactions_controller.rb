module LoansSection
  class TransactionsController < ApplicationController
    def index
      @transactions = current_user.entries
    end
  end
end
