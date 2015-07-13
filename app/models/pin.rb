class Pin < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Scopes
    scope :recent, -> { order('created_at desc')}
    scope :priority, -> { order('priority asc')}

  # Validations
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Public Methods
  def is_video?
    media_type == 'video'
  end

  def is_image?
    media_type == 'image'
  end
end
