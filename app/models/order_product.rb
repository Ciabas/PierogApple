# table binding orders and products
class OrderProduct < ActiveRecord::Base
  belongs_to :order, dependent: :destroy
  belongs_to :product

  validates :product_id, :quantity, :product_name, :product_price, :order_id, presence: true
end
