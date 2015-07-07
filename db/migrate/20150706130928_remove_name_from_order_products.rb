class RemoveNameFromOrderProducts < ActiveRecord::Migration
  def change
    remove_column :order_products, :name, :string
  end
end
