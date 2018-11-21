class AddAttachmentPhotoToRemades < ActiveRecord::Migration[5.1]
  def self.up
    change_table :remades do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :remades, :photo
  end
end
