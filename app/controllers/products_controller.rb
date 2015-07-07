class ProductsController < ApplicationController
  include Filterable
  
  def index
    cart_count
    @sliders = SliderImage.all
    @categories = Category.all
    @gears = Gear.base
    @products, @cid, @price_low, @price_high, @models, @g, @m = params_check
  end
  
  def show
    @product = Product.find(params[:id])
    @similar = Product.where(category_id: @product.category_id, gear_id: @product.gear_id)
  end
end
