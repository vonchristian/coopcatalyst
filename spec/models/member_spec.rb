require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "validations" do
    it {is_expected.to validate_presence_of :first_name }
    it {is_expected.to validate_presence_of :middle_name }
    it {is_expected.to validate_presence_of :last_name }
    it {is_expected.to validate_presence_of :contact_number }
    it {is_expected.to validate_presence_of :sex }
    it {is_expected.to validate_presence_of :civil_status }
    it {is_expected.to validate_presence_of :date_of_birth }
    it { should validate_length_of(:contact_number).is_at_most(12) }
    it { should validate_length_of(:contact_number).is_at_least(11) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:occupations) }
  end

  describe "associations" do
    it { is_expected.to have_one :membership_fee }
    it { is_expected.to have_one :common_share_capital }
    it { is_expected.to have_one :preferred_share_capital }
    it { is_expected.to have_many :share_capitals }
    it { is_expected.to have_many :time_deposits }
    it { is_expected.to have_many :orders }
    it { is_expected.to have_many :line_items }
    it {is_expected.to have_many :occupations }
    it {is_expected.to have_many :loans }
    it {is_expected.to have_many :savings }
    it {is_expected.to have_many :contributions }
    it {is_expected.to have_many :programs }
  end

  describe "photo_attachment" do
    it { is_expected.to have_attached_file(:avatar) }
    it { is_expected.to validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
  end

  describe "enums" do
    it do
      is_expected.to define_enum_for(:sex).
      with([:male, :female])
    end

    it do
      is_expected.to define_enum_for(:civil_status).
      with([:married, :single, :widower, :annulled])
    end
  end

  it "#full_name" do
    member =create(:member, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")

    expect(member.full_name).to eql("Von Christian P. Halip")
  end

  it "#name" do
    member =build(:member, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")

    expect(member.name).to eql("Von Christian P. Halip")
  end

  it "#first_and_last_name" do
    member =build(:member, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")

    expect(member.first_and_last_name).to eql("Von Christian Halip")
  end

  it "#current_occupation" do
    member = create(:member)
    occupation = create(:occupation, member: member, current: true)

    expect(member.current_occupation).to eql(occupation)
  end
end
