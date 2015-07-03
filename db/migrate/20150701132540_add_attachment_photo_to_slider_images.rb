class AddAttachmentPhotoToSliderImages < ActiveRecord::Migration
  def self.up
    change_table :slider_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :slider_images, :photo
  end
end
