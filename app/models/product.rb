class Product < ActiveRecord::Base
  belongs_to :gear
  belongs_to :category
  has_many :product_images
  accepts_nested_attributes_for :product_images

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/}
  validates :price, :numericality => {:greater_than => 0}

  STATUSES = %w[dostepny niedostepny zamowienie]
end 
