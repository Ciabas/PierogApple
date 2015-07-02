class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized

  def index
    @users = User.count
   # @orders = Order.all
    @products = Product.count
    @categories = Category.count
    @models = Gear.notbase.count
    @types = Gear.base.count
  end

  private

  def authorized
    unless current_user.is_admin
      redirect_to root_path, alert: 'Nie masz uprawnień do przeglądania tej strony.'
   end
  end
end
