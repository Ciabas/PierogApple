class Admin::ProductsController < Admin::AdminController
  include Filterable
  
  def index
    @categories = Category.all
    @gears = Gear.base
    @products, @cid, @price_low, @price_high, @models, @g, @m = params_check
  end

  def show
    @product = Product.find(params[:id])
    @similar = Product.where(category_id: @product.category_id, gear_id: @product.gear_id)
  end

  def new
    @product = Product.new
    @categories = Category.all 
    @gears = Gear.all
    3.times {@product.product_images.build}
  end

  def create
    @product = Product.new(product_params)
    @categories = Category.all 
    @gears = Gear.all
    if @product.save
      redirect_to admin_products_path, notice: 'Produkt dodany'
    else 
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all 
    @gears = Gear.all
    3.times {@product.product_images.build}
  end

  def update
    @product = Product.find(params[:id])
    @categories = Category.all 
    @gears = Gear.all
    @images = @product.product_images
    @images.each do |i|
      i.destroy!
    end
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Produkt zmieniony'
    else 
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :status, :category_id, :gear_id, :description, product_images_attributes: [:caption, :photo])
  end
end
