require 'rails_helper'

RSpec.describe CoopServices::ShareCapitalProduct, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :minimum_paid_up_share_capital }
    it { is_expected.to validate_numericality_of :minimum_paid_up_share_capital }
  end
end
