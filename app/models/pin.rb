class Pin < ActiveRecord::Base

  # Associations
  belongs_to :user


  def is_video?
    media_type == 'video'
  end

  def is_image?
    media_type == 'image'
  end
end
