class Admin::OrdersController < Admin::AdminController
  
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @profile = @order.user.profile
  end

end
