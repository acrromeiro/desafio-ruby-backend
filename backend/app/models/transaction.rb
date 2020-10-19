
class Transaction < ApplicationRecord
  belongs_to :type_transaction
  belongs_to :store
  validates_associated :type_transaction, :store
  validates_cpf :cpf
  validates_date :date_transaction, on_or_before: lambda { Date.current }
  validates :abs_value, :card, :date_transaction, presence: true
  after_save :add_transaction_in_store
  after_destroy :remove_transaction_in_store

  def value
    if self.type_transaction.nil? or self.abs_value.nil?
      @value = 0.0
    elsif self.type_transaction.is_deposit
      @value = self.abs_value
    elsif self.type_transaction.is_out
      @value = self.abs_value * -1
    end
  end

  def add_transaction_in_store
    self.store.add_transaction(self)
  end

  def remove_transaction_in_store
    self.store.remove_transaction(self)
  end

  def self.convert_hash_to_object(hash)
    type_transaction = TypeTransaction.convert_hash_to_object(hash)
    store = Store.convert_hash_to_object(hash)

    cpf = hash[:cpf]
    abs_value = hash[:value]
    card = hash[:card]
    date_transaction = Time.zone.strptime("#{hash[:date]}#{hash[:hour]}", "%Y%m%d%H%M%S")

    self.create(
        store:store,
        type_transaction:type_transaction,
        cpf: cpf,
        abs_value: abs_value,
        card: card,
        date_transaction: date_transaction
    )
  end

  def create(attributes = nil, &block)
    super
  end

  def self.create(attributes = nil, &block)
    transaction = super
    transaction.add_transaction_in_store
    transaction
  end
end
