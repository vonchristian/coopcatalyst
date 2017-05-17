shared_examples_for 'a Freight subtype' do |elements|
  let(:freight) { build(elements[:kind]) }
  subject { freight }

  it { is_expected.to be_valid }
end
