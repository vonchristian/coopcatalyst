require 'rails_helper'

module Members
  describe TimeDeposit do
    describe "associations" do
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :branch }
      it { is_expected.to belong_to :time_deposit_product }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :account_number }
      it { is_expected.to validate_uniqueness_of :account_number }
      it { is_expected.to validate_presence_of :time_deposit_product_id }
      # it do
      #   is_expected.to validate_uniqueness_of(:time_deposit_product_id).scoped_to(:member)
      # end
    end

    describe "delegations" do
      it do
        is_expected.to delegate_method(:name).to(:time_deposit_product).with_prefix
      end
    end
  end
end
