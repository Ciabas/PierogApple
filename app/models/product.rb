class Product < ActiveRecord::Base
  belongs_to :gear
  belongs_to :category
  has_many :product_images
  accepts_nested_attributes_for :product_images, :reject_if => lambda { |t| t['trip_image'].nil? }

  validates :name, :price, presence: true 
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
end 