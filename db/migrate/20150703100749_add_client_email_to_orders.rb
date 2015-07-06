class AddClientEmailToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :client_email, :string
  end
end
