class Admin::ProductsController < Admin::AdminController
  
  def index
    @categories = Category.all
    @gears = Gear.base
    @products, @cid, @price_low, @price_high, @models, @g, @m = params_check
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

  def params_check    
    products = Product.all
    unless params[:cid].blank?
      products = products.where( category_id: params[:cid] )
      cid = params[:cid]
    end
    unless params[:price_min].blank?
      products = products.where( [ 'price >= ?', params[:price_min] ] )
      price_low = params[:price_min]
    end
    unless params[:price_max].blank?
      products = products.where( [ 'price <= ?', params[:price_max] ] )
      price_high = params[:price_max]
    end
    unless params[:g].blank?
      gear = Gear.where(parent_id: params[:g])
      products = products.where( gear_id: gear )
      models = Gear.where( parent_id: params[:g] )
      g = params[:g]
    end
    unless params[:m].blank?
      products = products.where( gear_id: params[:m] )
      m = params[:m]
    end
    return products, cid, price_low, price_high, models, g, m  
  end
end
