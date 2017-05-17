require 'rails_helper'

module LoansSection
  describe Loan do
    describe "associations" do
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :loan_product }
      it { is_expected.to belong_to :branch }
      it { is_expected.to have_many :loan_approvals }
    end

    describe "validations" do
      it {is_expected.to validate_presence_of :amount }
      it {is_expected.to validate_numericality_of :amount }
    end
    describe "delegations" do
      it do
        is_expected.to delegate_method(:name).to(:loan_product).with_prefix
      end
    end
  end
end
