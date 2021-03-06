# model for product
class Product < ActiveRecord::Base
  belongs_to :gear
  belongs_to :category
  has_many :product_images
  has_many :order_products
  has_many :orders, through: :order_product
  accepts_nested_attributes_for :product_images

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than: 0 }
  validates_presence_of :product_images

  STATUSES = %w(dostepny niedostepny zamowienie)
end
