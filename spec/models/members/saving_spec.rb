require 'rails_helper'
module Members
  describe Saving do
    describe "associations" do
      it { is_expected.to belong_to :savings_product }
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :branch }


    end

    describe "validations" do
      it { is_expected.to validate_presence_of :date_opened }
      it { is_expected.to validate_presence_of :account_number }
      it { is_expected.to validate_uniqueness_of :account_number }
      # it do
      #   is_expected.to validate_uniqueness_of(:savings_product_id).scoped_to(:member)
      # end
    end

    describe "delegations" do
      it do
        is_expected.to delegate_method(:name).to(:savings_product).with_prefix
      end
    end
  end
end
