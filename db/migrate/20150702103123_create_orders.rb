class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :company_first_name
      t.string :company_last_name
      t.string :company_phone_no
      t.string :company_street_name
      t.string :company_house_no
      t.string :company_apartment_no
      t.string :company_zip_code
      t.string :company_city_name
      t.string :client_first_name
      t.string :client_last_name
      t.string :client_phone_no
      t.string :client_street_name
      t.string :client_house_no
      t.integer :client_apartment_no
      t.string :client_zip_code
      t.string :client_city_name
      t.belongs_to :user
      t.float :sum
      t.timestamps
    end
  end
end
