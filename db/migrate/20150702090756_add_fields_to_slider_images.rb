class AddFieldsToSliderImages < ActiveRecord::Migration
  def change
    add_column :slider_images, :title, :string
    add_column :slider_images, :caption, :string
    add_column :slider_images, :link, :string
  end
end
