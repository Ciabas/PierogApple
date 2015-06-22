class Product < ActiveRecord::Base
  has_one :gear
  has_one :category

  validates :name, :price, presence: true 
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
end 