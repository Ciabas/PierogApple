module Admin
  # responsible for managing products in admin panel
  class ProductsController < Admin::AdminController
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
      3.times { @product.product_images.build }
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
      3.times { @product.product_images.build }
    end

    def update
      @product = Product.find(params[:id])
      @categories = Category.all
      @gears = Gear.all
      @images = @product.product_images
      @images.each &:destroy!
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Produkt zmieniony'
      else
        render :edit
      end
    end
  
    def products_seq
      @products = Product.all.order(displayorder: :asc)
      @sliders = SliderImage.all
      @categories = Category.all
      @gears = Gear.base
      @models = Gear.where.not(parent_id: nil)
    end
    
    def products_seq_update
      params[:ids].each_with_index do |pid,index|
        p = Product.find(pid)
        p.displayorder = index
        p.save
      end
      render json: 'Układ produktów został zapisany.'
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :status, :category_id,
                                        :gear_id, :description,
                                        product_images_attributes: [:caption, :photo])
    end
  end
end
