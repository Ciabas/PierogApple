class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all 
    @gears = Gear.all
    # 3.times {@product.product_images.build}
  end

  def create
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
    params.require(:product).permit(:name, :price, :category_id, :gear_id, :description)
  end
end