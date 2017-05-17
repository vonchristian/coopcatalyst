require 'rails_helper'

RSpec.describe Cooperative, type: :model do
  describe "associations" do
    it { is_expected.to have_many :programs }
    it { is_expected.to have_many :branches }
    it { is_expected.to have_many :departments }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :contact_number }
  end
end
