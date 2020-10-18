
class Transaction < ApplicationRecord
  belongs_to :type_transaction
  belongs_to :store
end
