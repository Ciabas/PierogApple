class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :gear_id
      t.string :name, unique: true
      t.float :price
      t.text :description
      t.timestamps
    end
  end
end
