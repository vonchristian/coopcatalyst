require 'rails_helper'

module Coop
  describe Branch do
    describe "associations" do
      it { is_expected.to belong_to :cooperative }
      it { is_expected.to have_many :departments }
      it { is_expected.to have_many :members }

    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :address }
      it { is_expected.to validate_presence_of :contact_number }
      it { is_expected.to validate_uniqueness_of :name }
    end

    describe "enums" do
      it { is_expected.to define_enum_for(:branch_type).with([:main, :sattelite]) }
    end
  end
end
