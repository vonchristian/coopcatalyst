require 'rails_helper'

describe Business do
  describe "associations" do
    it { is_expected.to belong_to :owner }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :contact_number }
    it { is_expected.to validate_presence_of :address }
    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:owner_id)
    end
  end
end
