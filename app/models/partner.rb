class Partner < ActiveRecord::Base

  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Scopes
  scope :recent, -> { order('created_at desc')}
  scope :priority, -> { order('priority asc')}

  # Validations
  validates_presence_of :name
  validates_presence_of :avatar

  # Paperclip
  has_attached_file :avatar, :styles => { mega: "800x800>", large: "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
