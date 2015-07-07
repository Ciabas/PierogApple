class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :order_products, :name, :string
    add_column :orders, :company_number, :string
    add_column :orders, :company_account_no, :string
    add_column :orders, :company_bank_name, :string
    add_column :orders, :access_token, :string
  end
end
