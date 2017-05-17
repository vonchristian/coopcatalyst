shared_examples_for 'a Members::ShareCapital subtype' do |elements|
  let(:share_capital) { build(elements[:kind]) }
  subject { share_capital }

  it { should be_valid }

  it "expected to require an account_number" do
    share_capital.account_number = nil
    expect(share_capital).to_not be_valid
  end
end
