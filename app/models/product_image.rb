class ProductImage < ActiveRecord::Base
  attr_accessor :photo

  belongs_to :product
  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
end
