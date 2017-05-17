require 'rails_helper'

describe Approval do
  describe "associations" do
    it { is_expected.to belong_to :approvable }
    it { is_expected.to belong_to :approver }

  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :reference_number }
    it { is_expected.to validate_presence_of :remarks }
  end
end
