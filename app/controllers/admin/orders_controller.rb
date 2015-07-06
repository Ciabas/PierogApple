class Admin::OrdersController < Admin::AdminController
  
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @orders = Order.find(params[:id])
  end

end
