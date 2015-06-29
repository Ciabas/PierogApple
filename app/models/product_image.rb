class ProductImage < ActiveRecord::Base

  belongs_to :product
  has_attached_file :photo, :styles => { :miniature => "40x40>"}
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
end
