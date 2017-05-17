require 'rails_helper'

module Coop
  describe Department do
    describe "associations" do
      it { is_expected.to belong_to :branch }
      it { is_expected.to have_many :users }
      it { is_expected.to have_many :entries }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end

    describe "delegations" do
      it { is_expected.to delegate_method(:name).to(:branch).with_prefix }
    end
  end
end
