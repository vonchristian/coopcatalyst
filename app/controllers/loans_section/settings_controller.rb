module LoansSection
  class SettingsController < ApplicationController
    def index
      @loan_approvers = LoansSection::LoanApprover.all
    end
  end
end
