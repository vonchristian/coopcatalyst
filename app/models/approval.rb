class Approval < ApplicationRecord
  belongs_to :approver, polymorphic: true
  belongs_to :approvable, polymorphic: true

  validates :date, :reference_number, :remarks, presence: true
end
