class ApplicationRecord < ActiveRecord::Base
  protected_methods true
  self.abstract_class = true
end
