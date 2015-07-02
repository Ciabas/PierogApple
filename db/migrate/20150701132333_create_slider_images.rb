class CreateSliderImages < ActiveRecord::Migration
  def change
    create_table :slider_images do |t|

      t.timestamps null: false
    end
  end
end
