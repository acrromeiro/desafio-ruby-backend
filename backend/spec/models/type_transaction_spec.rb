
require 'rails_helper'

RSpec.describe TypeTransaction do
  subject = nil
  before(:each) do
    subject = TypeTransaction.find_by(external_id: 1)
  end

  after(:each) do
    subject = nil
  end

  it "valid object" do
    expect(subject).to be_valid
  end

  it "invalid without a external_id" do
    subject.external_id = nil
    expect(subject).to_not be_valid
  end

  it "invalid without a  description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "invalid without a  order" do
    subject.order = nil
    expect(subject).to_not be_valid
  end



end