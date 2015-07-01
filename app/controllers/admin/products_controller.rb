class Admin::ProductsController < Admin::AdminController
  
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id, :gear_id, :description, product_images_attributes: [:caption, :photo])
  end
end
