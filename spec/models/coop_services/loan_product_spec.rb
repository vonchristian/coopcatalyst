require 'rails_helper'

module CoopServices
  describe LoanProduct do
    describe "validations" do
      it do
        is_expected.to validate_numericality_of(:interest_rate)
      end
      it do
        is_expected.to validate_numericality_of(:term)
      end
      it { is_expected.to validate_presence_of :interest_rate }
      it { is_expected.to validate_presence_of :term }

      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
