class SliderImage < ActiveRecord::Base
  has_attached_file :photo, :styles => { :miniature => "50x50>", :thumb => "250x250#" }
  validates_attachment_presence :photo, :message => 'Nie dodano zdjęcia'
  validates_attachment_size :photo, :less_than => 5.megabytes, :message => 'Za duży rozmiar pliku'
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png), :message => 'Niewłaściwy format zdjęcia'
end
