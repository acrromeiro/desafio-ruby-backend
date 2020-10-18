class StoreService
  def self.get_all_stores
    Store.all
  end

  def self.get_store_transactions(store)
    store.get_store_all_info_transactions
  end

  def self.get_by_id(store_id)
    Store.find_by(id: store_id)
  end
end