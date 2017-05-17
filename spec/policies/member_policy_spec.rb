require 'rails_helper'

describe MemberPolicy do
  subject { described_class.new(user, member) }

  let(:member) { create(:member) }

  context 'not logged in user' do
    let(:user) { nil }

    it { is_expected.to forbid_action(:new) }
    # it { is_expected.to forbid_action(:destroy) }
  end

  context 'being a manager' do
    let(:user) { create(:user, role: 'manager') }

    it { is_expected.to permit_action(:new) }
  end
end
