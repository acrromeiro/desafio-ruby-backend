class Store < ApplicationRecord
  has_many :transactions
  validates :name, :owner, presence: true

  def self.convert_hash_to_object(hash)
    store = self.find_by(name: hash[:store])
    if store.nil?
      store = self.create(name: hash[:store], owner:  hash[:owner])
    end
    store
  end

  def add_transaction(transaction)
    self.total += transaction.value
    self.save
  end

  def remove_transaction(transaction)
    self.total -= transaction.value
    self.save
  end


end

