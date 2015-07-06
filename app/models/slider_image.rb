class SliderImage < ActiveRecord::Base
  has_attached_file :photo, :styles => { :slider => "1400x600#", :miniature => "50x50#" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
end
