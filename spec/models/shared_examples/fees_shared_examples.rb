shared_examples_for 'a Fee subtype' do |elements|
  let(:fee) { create(elements[:kind])}
  subject { fee }

  it "requires a name" do
    fee.name = nil
    expect(fee).to_not be_valid
  end
end
