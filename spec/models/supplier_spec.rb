require 'rails_helper'

describe Supplier do
  describe "associations" do
    it { is_expected.to have_many :businesses }
  end

  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for(:businesses) }
  end

  it "#full_name" do
    supplier =create(:supplier, first_name: "Von Christian", last_name: "Halip")

    expect(supplier.full_name).to eql("Von Christian Halip")
  end
end
