class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.float :price
      t.timestamps
    end
  end
end
