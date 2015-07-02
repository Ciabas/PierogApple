class OrderProduct < ActiveRecord::Base
  
  belongs_to :order, dependent: :destroy
  belongs_to :product
  
end
