class AddDisplayOrderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :displayorder, :integer
  end
end
