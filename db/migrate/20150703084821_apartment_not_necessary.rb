class ApartmentNotNecessary < ActiveRecord::Migration
  def change
    remove_column :profiles, :apartment_no, :integer
    add_column :profiles, :apartment_no, :integer
  end
end
