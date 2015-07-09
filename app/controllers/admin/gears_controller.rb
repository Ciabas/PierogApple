module Admin
  # responsible for managing types and models of products from admin panel
  class GearsController < Admin::AdminController
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
        if @gear.parent_id.nil?
          redirect_to admin_gears_path, notice: 'Typ dodany'
        else
          redirect_to admin_modelindex_path, notice: 'Model dodany'
        end
      else
        if @gear.parent_id.nil?
          render :new
        else
          render :new_model
        end
      end
    end

    def edit
      @gear = Gear.find(params[:id])
    end

    def update
      @gear = Gear.find(params[:id])
      @types = Gear.base
      if @gear.update(model_params)
        if @gear.parent_id.nil?
          redirect_to admin_gears_path, notice: 'Typ zmieniony'
        else
          redirect_to admin_modelindex_path, notice: 'Model zmieniony'
        end
      else
        render :edit
      end
    end

    def destroy
      @gear = Gear.find(params[:id])
      @models = Gear.where(parent_id: @gear.id)
      @products = Product.where(gear_id: @gear.id)
      if @models.empty? && @products.empty?
        @gear.destroy
        flash[:notice] = 'Usunięto'
      else
        flash[:alert] = 'Nie można usunąć'
      end

      if @gear.parent_id
        redirect_to admin_modelindex_path
      else
        redirect_to admin_gears_path
      end
    end

    private

    def model_params
      params.require(:gear).permit(:name, :parent_id)
    end
  end
end
