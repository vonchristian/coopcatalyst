shared_examples_for 'a Subscriber subtype' do |elements|
  let(:subscriber) { create(elements[:kind])}
  subject { subscriber }

  it "requires a name" do
    subscriber.name = nil
    expect(subscriber).to_not be_valid
  end
end
