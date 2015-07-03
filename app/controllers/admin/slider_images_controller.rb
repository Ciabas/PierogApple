class Admin::SliderImagesController < Admin::AdminController
  def index
    @sliders=SliderImage.all
  end

  def new
    @slider_image = SliderImage.new
  end

  def create
    @slider_image = SliderImage.new(slider_image_params)
    if @slider_image.save
      redirect_to admin_slider_images_path, notice: 'Zdjęcie dodane'
    else 
      render :new, error: 'Błąd, sprawdź parametry'
    end
  end

  def destroy
    @slider_image = SliderImage.find(params[:id])
    @slider_image.destroy
    redirect_to admin_slider_images_path, notice: 'Zdjęcie usunięte'
  end

  private

  def slider_image_params
    params.require(:slider_image).permit(:title, :caption, :link, :photo)
  end

end
