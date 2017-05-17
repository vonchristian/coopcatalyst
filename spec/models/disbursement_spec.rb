require 'rails_helper'

describe Disbursement do
  describe "associations" do
    it { is_expected.to have_one :entry }
    it { is_expected.to belong_to :disbursementable }
    it { is_expected.to belong_to :user }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:amount).to(:disbursementable) }
  end
end
