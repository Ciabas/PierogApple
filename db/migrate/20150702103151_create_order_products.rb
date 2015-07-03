class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.integer :quantity
      t.string :product_name
      t.float :product_price
      t.timestamps
    end
  end
end
