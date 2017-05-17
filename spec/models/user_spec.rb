require 'rails_helper'

describe User do
  describe "associations" do
    it { is_expected.to belong_to :branch }
    it { is_expected.to belong_to :department }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :department_id }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:branch).with_prefix }
    it { is_expected.to delegate_method(:name).to(:department).with_prefix }
  end

  describe "photo_attachment" do
    it { is_expected.to have_attached_file(:avatar) }
    it { is_expected.to validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:role).with([:manager, :loan_officer, :teller, :cashier]) }
  end

  it "#full_name" do
    user =create(:member, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")

    expect(user.full_name).to eql("Von Christian P. Halip")
  end
end
