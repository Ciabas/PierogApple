class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized

  def admin
    @users = User.all
   # @orders = Order.all
    @products = Product.all
    @categories = Category.all
    @models = Gear.notbase
    @types = Gear.base
  end

  private
  def authorized
    unless current_user.is_admin
     flash[:error] = "Nie masz uprawnień do przeglądania tej strony."
     redirect_to root_path
   end
  end
end
