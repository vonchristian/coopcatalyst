module CoopServices
  class LoanProduct < ApplicationRecord
    validates :interest_rate, :term, numericality: true, presence: true
    validates :name, presence: true, uniqueness: true
  end
end
