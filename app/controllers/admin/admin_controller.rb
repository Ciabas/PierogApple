module Admin
  # responsible for admin panel view
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorized

    def index
      @users = User.count
      @orders = Order.count
      @products = Product.count
      @categories = Category.count
      @models = Gear.notbase.count
      @types = Gear.base.count
      @slider_images = SliderImage.count
    end

    private

    def authorized
      redirect_to root_path,
                  alert: 'Nie masz uprawnień do przeglądania tej strony.' unless current_user.is_admin
    end
  end
end
