shared_examples_for 'a Tax subtype' do |elements|
  let(:tax) { create(elements[:kind])}
  subject { tax }

  it "requires a name" do
    tax.name = nil
    expect(tax).to_not be_valid
  end
end
