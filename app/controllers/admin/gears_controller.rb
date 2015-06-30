class Admin::GearsController < Admin::AdminController
# types  
  def index
    @basegears = Gear.base
  end

  def new
    @type = Gear.new
  end

  def create
    @type = Gear.new(type_params)
    if @type.save
      redirect_to admin_gears_path, notice: 'Typ dodany'
    else 
      render :new, alert: 'Błąd, sprawdź parametry'
    end
  end

  def destroy
    @type = Gear.find(params[:id])
    @models = Gear.where("parent_id = ?", @type.id)
    if @models.empty?
      @type.destroy
      redirect_to admin_gears_path, notice: "Typ usunięty"
    else
      redirect_to admin_gears_path, alert: 'Nie można usunąć typu, którego posiadasz modele.'
    end
  end

# models
  def modelindex
    @gears = Gear.notbase
  end

  def new_model
    @model = Gear.new
    @types = Gear.base
  end

  def create_model
    @model = Gear.new(model_params)
    @types = Gear.base
    if @model.save
      redirect_to admin_modelindex_path, notice: 'Model dodany'
    else 
      render :new_model, error: 'Błąd, sprawdź parametry'
    end
  end

  def destroy_model
    @model = Gear.find(params[:id])
    @products = Product.where("gear_id = ?", @model.id)
    if @products.empty?
      @model.destroy
      redirect_to admin_modelindex_path, notice: 'Model usunięty'
    else
      redirect_to admin_modelindex_path, alert: 'Nie można usunąć modelu, do którego pasują produkty.'
    end
  end

  private
  def model_params
    params.require(:gear).permit(:name, :parent_id)
  end

  def type_params
    params.require(:gear).permit(:name)
  end

end
