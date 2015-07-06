class Admin::CategoriesController < Admin::AdminController
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Kategoria dodana'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Kategoria zmieniona'
    else 
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
    if @products.empty?
      @category.destroy
      flash[:notice] = 'Usunięto kategorię'
    else
      flash[:alert] = 'Nie można usunąć kategorii, do której należą produkty.'
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
