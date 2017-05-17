module CoopServices
  class SavingsProduct < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :interest_rate, presence: true, numericality: true
  end
end
