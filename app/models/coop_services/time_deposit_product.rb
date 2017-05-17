module CoopServices
  class TimeDepositProduct < ApplicationRecord
    has_many :time_deposits, class_name: "Members::TimeDeposit"
    has_many :members, through: :time_deposits
    validates :name, presence: true, uniqueness: true
    validates :starting, :ending, :interest_rate, presence: true, numericality: true
  end
end
