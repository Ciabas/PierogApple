class Admin::CategoriesController < Admin::AdminController
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(:name)
    if @category.save
      redirect_to root_url
    else
      render :new
    end
  end

end
