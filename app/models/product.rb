class Product < ActiveRecord::Base
  belongs_to :gear
  belongs_to :category
  has_many :product_images
  accepts_nested_attributes_for :product_images

  validates :name, :price, presence: { message: '- nie wypełniono pola'}
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ , message: '- niewłaściwy format'}, 
            :numericality => {:greater_than => 0, message: '- niewłaściwy format'}
end 
