class RemoveCaptionFromProductImages < ActiveRecord::Migration
  def change
    remove_column :product_images, :caption, :string
  end
end
