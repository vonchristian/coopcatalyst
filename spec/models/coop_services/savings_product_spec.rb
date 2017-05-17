require 'rails_helper'

module CoopServices
  describe SavingsProduct do
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
      it { is_expected.to validate_presence_of :interest_rate }
      it { is_expected.to validate_numericality_of :interest_rate }
    end
  end
end
