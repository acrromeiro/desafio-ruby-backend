require 'rails_helper'

RSpec.describe Store do
  subject = nil
  before(:each) do
    subject = Store.create(name: 'BAR DO JOÃO', owner: 'JOÃO MACEDO')
  end

  after(:each) do
    subject.destroy
  end

  it "valid object" do
    expect(subject).to be_valid
  end

  it "invalid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "invalid without a  owner" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  it "valid total in add transaction" do
    expect(subject.total).to eql 0.0
    type_transaction = TypeTransaction.find_by(external_id: 1)
    Transaction.create(
        store:subject,
        type_transaction:type_transaction,
        cpf: "123",
        abs_value: 100.0,
        card: "3434",
        date_transaction: Date.current
    )
    expect(subject.total).to eql 100.0
  end

  it "valid total in remove transaction" do
    expect(subject.total).to eql 0.0
    type_transaction = TypeTransaction.find_by(external_id: 1)
    trasaction = Transaction.create(
        store:subject,
        type_transaction:type_transaction,
        cpf: "123",
        abs_value: 100.0,
        card: "3434",
        date_transaction: Date.current
    )
    expect(subject.total).to eql 100.0
    trasaction.destroy
    expect(subject.total).to eql 0.0
  end


end