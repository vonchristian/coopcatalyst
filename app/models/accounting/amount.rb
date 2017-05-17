module Accounting
  class Amount < ActiveRecord::Base
    belongs_to :entry, :class_name => 'Accounting::Entry'
    belongs_to :account, :class_name => 'Accounting::Account'

    validates_presence_of :type, :amount, :entry, :account
  end
end
