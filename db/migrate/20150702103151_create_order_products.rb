class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.belongs_to :product
      t.integer :quantity
      t.float :price
      t.belongs_to :order
      t.timestamps
    end
  end
end
