require 'rails_helper'
module Members
  describe Relationship do
    describe "associations" do
      it { is_expected.to belong_to :relationer }
      it { is_expected.to belong_to :relationee }
    end

    describe "enums" do
      it { is_expected.to define_enum_for(:relationship_type).with([:mother, :father, :brother, :sister, :daughter, :son, :grandfather, :grandmother, :wife, :husband])}
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :relationer_id }
      it { is_expected.to validate_presence_of :relationee_id }
    end
  end
end
