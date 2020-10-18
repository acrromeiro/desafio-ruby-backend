class ApplicationRecord < ActiveRecord::Base
  private_class_method :new, :create
  private_methods :save
  self.abstract_class = true
end
