class Admin::GearsController < Admin::AdminController 
  def index
    @basegears = Gear.base
  end

  def modelindex
    @notbasegears = Gear.notbase
  end

  def new
    @gear = Gear.new
  end

  def new_model
    @gear = Gear.new
    @types = Gear.base
  end

  def create
    @gear = Gear.new(model_params)
    @types = Gear.base
    if @gear.save
      if (@gear.parent_id == nil)
        redirect_to admin_gears_path, notice: 'Typ dodany'
      else
        redirect_to admin_modelindex_path, notice: 'Model dodany'
      end
    else 
      if (@gear.parent_id == nil)
        render :new, alert: 'Błąd, sprawdź parametry'
      else
        render :new_model, alert: 'Błąd, sprawdź parametry'
      end
    end
  end

  def edit
    @gear = Gear.find(params[:id])
  end

  def edit_model
    @gear = Gear.find(params[:id])
    @types = Gear.base
  end

  def update
    @gear = Gear.find(params[:id])
    @types = Gear.base
    if @gear.update(model_params)
      if (@gear.parent_id == nil)
        redirect_to admin_gears_path, notice: 'Typ zmieniony'
      else
        redirect_to admin_modelindex_path, notice: 'Model zmieniony'
      end
    else 
      if (@gear.parent_id == nil)
        render :edit, alert: 'Błąd, sprawdź parametry'
      else
        render :edit_model, alert: 'Błąd, sprawdź parametry'
      end
    end
  end

  def destroy
    @gear = Gear.find(params[:id])
    @models = Gear.where("parent_id = ?", @gear.id)
    @products = Product.where("gear_id = ?", @gear.id)
    if @models.empty?
      if @products.empty?
        @gear.destroy
        if (@gear.parent_id == nil)
          redirect_to admin_gears_path, notice: 'Typ usunięty'
        else
          redirect_to admin_modelindex_path, notice: 'Model usunięty'
        end
      else
        redirect_to admin_modelindex_path, alert: 'Nie można usunąć modelu, dla którego posiadasz produkty.'
      end
    else
      redirect_to admin_gears_path, alert: 'Nie można usunąć typu, którego posiadasz modele.'
    end
  end

  private
  def model_params
    params.require(:gear).permit(:name, :parent_id)
  end

end
