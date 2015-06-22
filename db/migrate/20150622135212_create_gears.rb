class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :parrent_id
      t.string :name, unique: true
      t.timestamps
    end
  end
end
