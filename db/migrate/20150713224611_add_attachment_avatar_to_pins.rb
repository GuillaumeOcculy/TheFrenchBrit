class AddAttachmentAvatarToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :pins, :avatar
  end
end
