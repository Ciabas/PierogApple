class ProductsController < ApplicationController
  
  def index
    @categories = Category.all
    if params[:category_id].blank?
      @products = Product.all
    else
      @products = Product.where(category_id: params[:category_id])
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id, :gear_id, :description, product_images_attributes: [:caption, :photo])
  end
end
