class TypeTransaction < ApplicationRecord
  validates :external_id, :description, :order, presence: true

  def is_deposit
    order == "deposit"
  end

  def is_out
    order == "out"
  end


  def self.convert_hash_to_object(hash)
    type_transaction = self.find_by(external_id: hash[:type])
    if type_transaction.nil?
      raise BusinessException.new( "Unknow Type Transaction","TT001")
    end
    type_transaction
  end


end
