class SliderImage < ActiveRecord::Base
   
  if Rails.env.production?
    has_attached_file :photo, :styles => { :slider => "1400x600#", :miniature => "50x50#" },
      :storage => :s3,
      :path => '/:class/:attachment/:id_partition/:style/:filename',
      :bucket => 'applepierog',
      :url  => ':s3_domain_url',
      :s3_credentials => 'config/s3.yml',
      :s3_endpoint => 's3-eu-central-1.amazonaws.com',
      :s3_region => 'eu-central-1'
  else
    has_attached_file :photo, :styles => { :slider => "1400x600#", :miniature => "50x50#" }
  end

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
end
