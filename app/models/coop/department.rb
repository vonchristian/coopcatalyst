module Coop
  class Department < ApplicationRecord
    belongs_to :branch, class_name: "Coop::Branch"
    has_many :users
    has_many :entries, class_name: "Accounting::Entry"

    validates :name, presence: true, uniqueness: true

    delegate :name, to: :branch, prefix: true, allow_nil: true
  end
end
