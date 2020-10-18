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

  def get_store_all_info_transactions
    Store.find_by_sql(["SELECT transactions.*,type_transactions.*,transactions.id FROM stores store
                      INNER JOIN transactions ON store.id = transactions.store_id
                      INNER JOIN type_transactions ON type_transactions.id = transactions.type_transaction_id
                      WHERE store.id = ?",self.id])
  end


end

