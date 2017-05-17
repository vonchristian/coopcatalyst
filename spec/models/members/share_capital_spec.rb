require 'rails_helper'

module Members
  describe ShareCapital do
    describe "associations" do
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :branch }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :account_number }
      it { is_expected.to validate_uniqueness_of :account_number }
    end
  end
end
