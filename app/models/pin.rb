class Pin < ActiveRecord::Base

  # Associations
  belongs_to :user

  # FriendlyId
	extend FriendlyId
  friendly_id :title, use: :slugged

  # Scopes
  scope :recent, -> { order('created_at desc')}
  scope :priority, -> { order('priority asc')}

  # Validations
  validates_presence_of :title
  validates_presence_of :media_type
  validates_presence_of :video_provider,  if: :is_video?
  validates_presence_of :video_reference, if: :is_video?
  validates_presence_of :avatar,          if: :is_image?
  # validates :link, :url => true, presence: false

  # Paperclip
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
