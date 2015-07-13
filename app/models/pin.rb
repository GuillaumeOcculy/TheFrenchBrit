class Pin < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Scopes
    scope :recent, -> { order('created_at desc')}
    scope :priority, -> { order('priority asc')}

  def is_video?
    media_type == 'video'
  end

  def is_image?
    media_type == 'image'
  end
end
