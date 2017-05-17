require 'rails_helper'

module Members
  describe Contribution do
    describe "associations" do
      it { is_expected.to belong_to :subscription }
      it { is_expected.to belong_to :contributor }
      it { is_expected.to belong_to :entry }
    end
  end
end
