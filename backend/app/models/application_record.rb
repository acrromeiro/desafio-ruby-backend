class ApplicationRecord < ActiveRecord::Base
  private_instance_methods [:save,:update,:update_attributes,:update_attribute]
  private_class_method :new
  self.abstract_class = true
end
