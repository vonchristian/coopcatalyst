require 'rails_helper'

module Members
  describe Occupation do
    describe "associations" do
      it { is_expected.to belong_to :member }
    end
    describe "associations" do
      it { is_expected.to validate_presence_of :title }
    end
  end
end
