class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name,  null: false
      t.string :last_name, null: false
      t.string :phone_no, null: false
      t.string :street_name,  null: false
      t.string :house_no,  null: false
      t.integer :apartment_no,  null: false
      t.string :zip_code,  null: false
      t.string :city_name, null: false 
      t.belongs_to :user
      t.timestamps
    end
  end
end
