class Contact < ActiveRecord::Base

  # Scopes
  scope :recent, -> { order('created_at desc')}
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message
end
