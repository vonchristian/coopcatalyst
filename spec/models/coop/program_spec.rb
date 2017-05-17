require 'rails_helper'
module Coop
  describe Program do
    describe "associations" do
      it { is_expected.to have_many :contributors }
      it { is_expected.to have_many :contributions }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
      it { is_expected.to validate_presence_of :contribution_amount }
      it { is_expected.to validate_numericality_of :contribution_amount }
    end
  end
end
