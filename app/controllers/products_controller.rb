class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    3.times {@product.product_images.build}
    @categories = Category.all 
    @gears = Gear.all
  end

  def create
    puts params.inspect
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_url
    else 
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_url
  end

  private
  def product_params
    params.require(:product).permit!#(:name, :price, :category_id, :gear_id, :description, :product_images_attributes)
  end
end