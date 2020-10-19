require 'rails_helper'

RSpec.describe Transaction do
  store = nil
  type_transaction = nil
  subject = nil
  before(:each) do
    store = Store.create(name: 'BAR DO JOÃO', owner: 'JOÃO MACEDO')
    type_transaction = TypeTransaction.find_by(external_id: 1)
    subject = Transaction.create(
        store:store,
        type_transaction:type_transaction,
        cpf: "75027874022",
        abs_value: 100.0,
        card: "3434",
        date_transaction: Date.current
    )
  end

  after(:each) do
    subject.destroy
    store.destroy
  end

  it "valid object" do
    expect(subject).to be_valid
  end

  it "invalid without a cpf" do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it "invalid cpf" do
    subject.cpf = "000"
    expect(subject).to_not be_valid
  end

  it "invalid without a  abs_value" do
    subject.abs_value = nil
    expect(subject).to_not be_valid
  end

  it "invalid without a  card" do
    subject.card = nil
    expect(subject).to_not be_valid
    end

  it "invalid without a  date_transaction" do
    subject.date_transaction = nil
    expect(subject).to_not be_valid
  end

  it "invalid date_transaction" do
    subject.date_transaction = Date.tomorrow
    expect(subject).to_not be_valid
  end

  it "valid value out transaction" do
    subject.destroy
    store.destroy

    store = Store.create(name: 'BAR DO JOÃO', owner: 'JOÃO MACEDO')
    type_transaction = TypeTransaction.find_by(order: "out")
    subject = Transaction.create(
        store:store,
        type_transaction:type_transaction,
        cpf: "75027874022",
        abs_value: 100.0,
        card: "3434",
        date_transaction: Date.current
    )
    expect(subject.value).to eql -100.0
  end

  it "invalid value out transaction" do
    subject.abs_value = nil
    expect(subject.value).to eql 0.0
  end

  it "valid value deposit transaction" do
    subject.destroy
    store.destroy

    store = Store.create(name: 'BAR DO JOÃO', owner: 'JOÃO MACEDO')
    type_transaction = TypeTransaction.find_by(order: "deposit")
    subject = Transaction.create(
        store:store,
        type_transaction:type_transaction,
        cpf: "75027874022",
        abs_value: 100.0,
        card: "3434",
        date_transaction: Date.current
    )
    expect(subject.value).to eql 100.0
  end

end