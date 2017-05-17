require 'rails_helper'

module CoopServices
  describe TimeDepositProduct do
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
      it { is_expected.to validate_presence_of :starting }
      it { is_expected.to validate_presence_of :ending }
      it { is_expected.to validate_presence_of :interest_rate }
      it { is_expected.to validate_numericality_of :starting }
      it { is_expected.to validate_numericality_of :ending }
      it { is_expected.to validate_numericality_of :interest_rate }
    end
  end
end
